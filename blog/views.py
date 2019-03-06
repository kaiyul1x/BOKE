from django.shortcuts import render_to_response, render, get_object_or_404
from .models import BlogType, Blog, ReadNum
from django.core.paginator import Paginator
from django.db.models import Count
from read_statistics.utils import read_statistics_once_read


# Create your views here.
def get_blog_common_data(request, blogs_all_list):
    paginator = Paginator(blogs_all_list, 2)
    page_num = request.GET.get('page', 1)
    page_of_blog = paginator.get_page(page_num)
    currentr_page_num = page_of_blog.number  # 获取当前页码
    page_range = list(range(max(currentr_page_num - 2, 1), currentr_page_num)) \
                 + list(range(currentr_page_num, min(currentr_page_num + 2 + 1, paginator.num_pages + 1)))
    # 加省略页码标记
    if int(page_range[0]) - 1 > 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] > 2:
        page_range.append('...')
    # 加上首页和尾页
    # print(type(page_range[0])) str
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)
    # 获取日期归档对应博客数量
    blog_with_dates = Blog.objects.dates('created_time', 'month', order='DESC')
    blog_dates = {}
    for blog_date in blog_with_dates:
        blog_count = Blog.objects.filter(created_time__year=blog_date.year,
                                         created_time__month=blog_date.month).count()
        blog_dates[blog_date] = blog_count

    # 博客分类数量
    # blog_types = BlogType.objects.all()
    # blog_type_list = []
    # for blog_type in blog_types:
    #     blog_type.blog_count = Blog.objects.filter(blog_type=blog_type).count()
    #     blog_type_list.append(blog_type)
    blog_types = BlogType.objects.annotate(blog_count=Count('blog'))

    content = {
        'blog_types': blog_types,
        'page_of_blog': page_of_blog,
        'page_range': page_range,
        'blogs': page_of_blog.object_list,
        'blog_dates': blog_dates,
    }
    return content


def blog_list(request):
    blogs_all_list = Blog.objects.all()
    content = get_blog_common_data(request, blogs_all_list)
    return render_to_response('blog/blog_list.html', content)


def blog_detail(request, blog_pk):
    blog = Blog.objects.get(pk=blog_pk)
    read_cookie_key=read_statistics_once_read(request,blog)
    c_time = blog.created_time
    previous_blog = Blog.objects.filter(created_time__gt=c_time).last()
    next_blog = Blog.objects.filter(created_time__lt=c_time).first()

    content = {
        'previous_blog': previous_blog,
        'next_blog': next_blog,
    }
    content['blog'] = get_object_or_404(Blog, pk=blog_pk)
    response = render_to_response('blog/blog_detail.html', content)
    response.set_cookie(read_cookie_key, 'true')
    return response


def blog_with_type(request, type_pk):
    blog_type = get_object_or_404(BlogType, pk=type_pk)
    blog = Blog.objects.filter(blog_type=blog_type)
    content = get_blog_common_data(request, blog)
    content['blog_type'] = blog_type
    return render_to_response('blog/blogs_with_type.html', content)


def blog_with_date(request, year, month):
    blog_date_list = Blog.objects.filter(created_time__year=year, created_time__month=month)
    paginator = Paginator(blog_date_list, 2)
    page_num = request.GET.get('page', 1)
    page_of_blog = paginator.get_page(page_num)
    # print(page_of_blog)
    currentr_page_num = page_of_blog.number  # 获取当前页码
    page_range = list(range(max(currentr_page_num - 2, 1), currentr_page_num)) \
                 + list(range(currentr_page_num, min(currentr_page_num + 2 + 1, paginator.num_pages + 1)))
    # 加省略页码标记
    if int(page_range[0]) - 1 > 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] > 2:
        page_range.append('...')
    # 加上首页和尾页
    # print(type(page_range[0])) str
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)
    blog_with_date = Blog.objects.dates('created_time', 'month', order='DESC')

    content = {
        'blog_types': BlogType.objects.all(),
        'page_of_blog': page_of_blog,
        'page_range': page_range,
        'blogs': page_of_blog.object_list,
        'blog_dates': blog_with_date,
        'blogs_with_date': '%s年%s月' % (year, month),

    }

    return render_to_response('blog/blogs_with_date.html', content)
