# Generated by Django 4.1.1 on 2022-11-15 18:07

import autoslug.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0005_remove_customerprofile_full_name_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordermaster',
            name='order_status',
            field=models.CharField(choices=[('Prepare for dishpatch', 'Prepare for dishpatch'), ('cancel', 'cancel'), ('On the way', 'On the way'), ('Order booked', 'Order booked'), ('delivered', 'delivered')], default='Order booked', max_length=50),
        ),
        migrations.AlterField(
            model_name='ordermaster',
            name='payment_status',
            field=models.CharField(choices=[('Failed', 'Failed'), ('Credit', 'Credit'), ('Pending', 'Pending')], default='Pending', max_length=50),
        ),
        migrations.AlterField(
            model_name='subcategory',
            name='slug',
            field=autoslug.fields.AutoSlugField(always_update=True, editable=False, populate_from='name', unique=True),
        ),
    ]
