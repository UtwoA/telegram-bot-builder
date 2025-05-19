from django.urls import path
from .views import CreateUserAPIView, authenticate_user, UserRetrieveUpdateAPIView

urlpatterns = [
    path('register/', CreateUserAPIView.as_view(), name='register'),

    path('login/', authenticate_user, name='login'),

    path('update/', UserRetrieveUpdateAPIView.as_view(), name='update'),

]