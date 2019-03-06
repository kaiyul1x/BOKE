from django.db import models
from django.contrib.auth.models import User
from read_statistics.models import ReadNum
from read_statistics.models import ReadNumExpandMethod
from django.contrib.contenttypes.models import ContentType


# Create your models here.
class BlogType(models.Model):
    type_name = models.CharField(max_length=15)

    def __str__(self):
        return self.type_name


class Blog(models.Model, ReadNumExpandMethod):
    title = models.CharField(max_length=50)
    content = models.TextField()
    blog_type = models.ForeignKey(BlogType, on_delete=models.DO_NOTHING)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    created_time = models.DateTimeField(auto_now_add=True)
    last_updated_time = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '<blog:%s>'%(self.title)

    class Meta:
        ordering = ['-created_time']
