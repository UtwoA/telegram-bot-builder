from __future__ import unicode_literals
from django.db import models, transaction
from django.utils import timezone
from django.contrib.auth.models import (AbstractBaseUser, PermissionsMixin, BaseUserManager)

class UserManager(BaseUserManager):

    def _create_user(self, email, password, **extra_fields):

        if not email:
            raise ValueError('Почта должна существовать')

        telegram_login = extra_fields.get('telegram_login')
        if telegram_login:
            if User.objects.filter(telegram_login=telegram_login).exists():
                raise ValidationError('Telegram-логин должен быть уникальным.')

        try:
            with transaction.atomic():
                user = self.model(email=email, **extra_fields)
                user.set_password(password)
                user.save(using=self._db)
                return user
        except:
            raise

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self._create_user(email, password=password, **extra_fields)

class User(AbstractBaseUser, PermissionsMixin):
    
    email = models.EmailField(max_length=40, unique=True)
    telegram_login = models.CharField(max_length=100, blank=True, null=True, unique=True)
    first_name = models.CharField(max_length=30, blank=True)
    last_name = models.CharField(max_length=30, blank=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name']

    def save(self, *args, **kwargs):
        if self.telegram_login == '':
            self.telegram_login = None
        super(User, self).save(*args, **kwargs)
        return self
