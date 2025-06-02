from rest_framework import serializers
from django.contrib.auth import authenticate, update_session_auth_hash


class ChangeEmailSerializer(serializers.Serializer):
    password = serializers.CharField(write_only=True)
    new_email = serializers.EmailField()


class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(write_only=True)
    new_password = serializers.CharField(write_only=True, min_length=6)
    confirm_new_password = serializers.CharField(write_only=True, min_length=6)

    def validate(self, data):
        if data['new_password'] != data['confirm_new_password']:
            raise serializers.ValidationError({"password": "Новые пароли не совпадают."})
        return data