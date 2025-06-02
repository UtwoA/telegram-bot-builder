from django.urls import path
from user_profile.views import ChangeEmailView, ChangePasswordView

urlpatterns = [
    path('change-email/', ChangeEmailView.as_view(), name='change_email'),

    path('change-password/', ChangePasswordView.as_view(), name='change_password'),
]