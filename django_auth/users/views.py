from rest_framework.views import APIView
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from django.contrib.auth.signals import user_logged_in
from rest_framework_simplejwt.tokens import RefreshToken  # Используем JWT из DRF Simple JWT
from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from .serializers import UserSerializer  # Импортируем сериализатор


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
    """
    API View для аутентификации пользователя.
    Возвращает JWT токен и данные пользователя при успешной аутентификации.
    """
    try:
        # Извлекаем email и password из запроса
        email = request.data.get('email')
        password = request.data.get('password')

        # Проверяем, что email и password предоставлены
        if not email or not password:
            return Response(
                {'error': 'Please provide both email and password'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Пытаемся найти пользователя по email
        try:
            user = User.objects.get(email=email)
        except ObjectDoesNotExist:
            return Response(
                {'error': 'User with this email does not exist'},
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
            'name': f"{user.first_name} {user.last_name}",
            'token': token,
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

