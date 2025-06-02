from django.urls import path, include
from .views import CreateUserAPIView, authenticate_user, UserRetrieveUpdateAPIView, PasswordResetView, PasswordResetConfirmView

urlpatterns = [
    path('register/', CreateUserAPIView.as_view(), name='register'),

    path('login/', authenticate_user, name='login'),

    path('update/', UserRetrieveUpdateAPIView.as_view(), name='update'),

    path('password/reset/', PasswordResetView.as_view(), name='password_reset'),

    path('password/reset/confirm/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),

    path('profile/', include('user_profile.urls')),

]