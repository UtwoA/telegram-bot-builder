from django.urls import path
from .views import CreateUserAPIView, authenticate_user

urlpatterns = [
    # URL для регистрации нового пользователя
    path('register/', CreateUserAPIView.as_view(), name='register'),

    # URL для аутентификации пользователя
    path('login/', authenticate_user, name='login'),
]