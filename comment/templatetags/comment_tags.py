from django import template
from django.conf import settings
from django.apps import apps
from django.db.models.aggregates import Count
from django.contrib.contenttypes.models import ContentType

from ..models import comForm

register = template.Library()


@register.simple_tag
def generate_form():
    form = comForm()
    return form
