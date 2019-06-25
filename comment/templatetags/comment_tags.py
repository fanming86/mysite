from django import template

from ..models import comForm

register = template.Library()


@register.simple_tag
def generate_form():
    form = comForm()
    return form
