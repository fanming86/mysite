# Generated by Django 2.0.3 on 2018-04-02 10:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myApp1', '0002_auto_20180402_1826'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='tags',
        ),
        migrations.AddField(
            model_name='post',
            name='tags',
            field=models.ManyToManyField(blank=True, to='myApp1.Tag'),
        ),
        migrations.AlterField(
            model_name='tag',
            name='name',
            field=models.CharField(max_length=100),
        ),
    ]
