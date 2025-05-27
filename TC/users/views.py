from rest_framework.views import APIView
from rest_framework.generics import RetrieveUpdateAPIView
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework import status

from django.contrib.auth import get_user_model
from django.contrib.auth.signals import user_logged_in
from django.contrib.auth.tokens import default_token_generator

from django.core.mail import send_mail
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.conf import settings
from django.contrib.auth import get_user_model

from rest_framework_simplejwt.tokens import RefreshToken
from django.core.exceptions import ObjectDoesNotExist

from .serializers import (
    UserSerializer,
    PasswordResetSerializer,
    PasswordResetConfirmSerializer,
)


User = get_user_model()


class CreateUserAPIView(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        # Получаем данные из запроса
        user_data = request.data
        serializer = UserSerializer(data=user_data)

        # Проверяем валидность данных
        serializer.is_valid(raise_exception=True)

        # Сохраняем пользователя
        serializer.save()

        # Возвращаем успешный ответ с данными пользователя
        return Response(serializer.data, status=status.HTTP_201_CREATED)


@api_view(['POST'])
@permission_classes([AllowAny])
def authenticate_user(request):
    try:
        # Извлекаем email и password из запроса
        login_input = request.data.get('login')
        password = request.data.get('password')

        # Проверяем, что email и password предоставлены
        if not login_input or not password:
            return Response(
                {'error': 'Представьте логин и пароль'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Пытаемся найти пользователя по email
        try:
            user = User.objects.get(email=login_input)
        except User.DoesNotExist:
            try:
                user = User.objects.get(telegram_login=login_input)
            except User.DoesNotExist:
                return Response(
                    {'error': 'Нет логина'},
                    status=status.HTTP_404_NOT_FOUND
                )

        # Проверяем пароль
        if not user.check_password(password):
            return Response(
                {'error': 'Invalid credentials'},
                status=status.HTTP_401_UNAUTHORIZED
            )

        # Генерируем JWT токен
        refresh = RefreshToken.for_user(user)
        token = {
            'refresh': str(refresh),
            'access': str(refresh.access_token),
        }

        # Формируем данные для ответа
        user_details = {
            "user": {
                "email": user.email,
                "telegram_login": user.telegram_login or None,
            },
            "tokens": {
                "access": str(refresh.access_token),
                "refresh": str(refresh),
            }
        }

        # Отправляем сигнал о входе пользователя
        user_logged_in.send(sender=user.__class__, request=request, user=user)

        return Response(user_details, status=status.HTTP_200_OK)

    except Exception as e:
        # Обрабатываем неожиданные ошибки
        return Response(
            {'error': f'An error occurred: {str(e)}'},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR
        )

class UserRetrieveUpdateAPIView(RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        # Можно отправлять как вложенный объект "user", так и напрямую
        data = request.data.get('user', request.data)
        serializer = self.get_serializer(self.request.user, data=data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)

class PasswordResetView(APIView):
    permission_classes = [AllowAny]
    def post(self, request):
        serializer = PasswordResetSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data['email']
            try:
                user = User.objects.get(email=email)

                # Генерация токена и uid
                uid = urlsafe_base64_encode(force_bytes(user.pk))
                token = default_token_generator.make_token(user)

                # Формируем ссылку
                reset_link = f"{settings.FRONTEND_URL}/reset-password/{uid}/{token}/"

                # Отправка письма
                send_mail(
                    subject="Восстановление пароля",
                    message=f"Для восстановления пароля перейдите по ссылке: {reset_link}",
                    from_email=settings.DEFAULT_FROM_EMAIL,
                    recipient_list=[email],
                )

                return Response(
                    {"message": "Ссылка для восстановления пароля отправлена"},
                    status=status.HTTP_200_OK
                )
            except User.DoesNotExist:
                return Response(
                    {"error": "Пользователь с таким email не найден"},
                    status=status.HTTP_404_NOT_FOUND
                )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


  # View для подтверждения сброса пароля
class PasswordResetConfirmView(APIView):
    permission_classes = [AllowAny]

    def post(self, request, uidb64, token):
        serializer = PasswordResetConfirmSerializer(data=request.data)
        if serializer.is_valid():
            new_password = serializer.validated_data['new_password']

            try:
                uid = force_str(urlsafe_base64_decode(uidb64))
                user = User.objects.get(pk=uid)
            except (TypeError, ValueError, OverflowError, User.DoesNotExist):
                return Response(
                    {"error": "Неверная ссылка или пользователь не найден"},
                    status=status.HTTP_400_BAD_REQUEST
                )

            if not default_token_generator.check_token(user, token):
                return Response(
                    {"error": "Неверный или истекший токен"},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # Устанавливаем новый пароль
            user.set_password(new_password)
            user.save()

            return Response(
                {"message": "Пароль успешно изменён"},
                status=status.HTTP_200_OK
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)