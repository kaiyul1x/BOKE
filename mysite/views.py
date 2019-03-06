from django.shortcuts import render_to_response
from django.contrib.contenttypes.models import ContentType
from blog.models import Blog
from read_statistics.utils import get_seven_days_read_data


def home(request):
    content_type = ContentType.objects.get_for_model(Blog)
    read_nums, dates = get_seven_days_read_data(content_type)
    context = {
        'read_nums': read_nums,
        'dates': dates,
    }
    return render_to_response('home.html', context)
