# Generated by Django 2.1.5 on 2019-03-03 13:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20190303_2117'),
    ]

    operations = [
        migrations.RenameField(
            model_name='readnum',
            old_name='readed_num',
            new_name='read_num',
        ),
    ]