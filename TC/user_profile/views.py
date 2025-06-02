# user_profile/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated

from user_profile.serializers import ChangeEmailSerializer, ChangePasswordSerializer
from django.contrib.auth import get_user_model, update_session_auth_hash

User = get_user_model()


class ChangeEmailView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ChangeEmailSerializer(data=request.data)
        if serializer.is_valid():
            password = serializer.validated_data['password']
            new_email = serializer.validated_data['new_email']

            user = request.user

            # Проверяем текущий пароль
            if not user.check_password(password):
                return Response(
                    {"error": "Неверный пароль"},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # Проверяем, не используется ли новый email кем-то ещё
            if User.objects.filter(email__iexact=new_email).exclude(pk=user.pk).exists():
                return Response(
                    {"error": "Этот email уже используется другим пользователем"},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # Обновляем email
            user.email = new_email
            user.save()

            return Response(
                {"message": "Email успешно изменён", "email": user.email},
                status=status.HTTP_200_OK
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data)
        if serializer.is_valid():
            old_password = serializer.validated_data['old_password']
            new_password = serializer.validated_data['new_password']

            user = request.user

            # Проверяем старый пароль
            if not user.check_password(old_password):
                return Response(
                    {"error": "Старый пароль неверен."},
                    status=status.HTTP_400_BAD_REQUEST
                )

            # Устанавливаем новый пароль
            user.set_password(new_password)
            user.save()

            # Сохраняем новую сессию
            update_session_auth_hash(request, user)

            return Response(
                {"message": "Пароль успешно изменён"},
                status=status.HTTP_200_OK
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)