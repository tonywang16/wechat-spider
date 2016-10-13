# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wechat', '0018_merge'),
    ]

    operations = [
        migrations.AddField(
            model_name='topic',
            name='url_perm',
            field=models.CharField(default=b'', max_length=500, verbose_name=b'\xe6\x96\x87\xe7\xab\xa0\xe7\x9a\x84\xe6\xb0\xb8\xe4\xb9\x85url'),
        ),
    ]
