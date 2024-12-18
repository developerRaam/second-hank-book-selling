# Generated by Django 4.1.1 on 2022-10-24 11:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0003_product_sub_category_alter_customerprofile_status_at_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='customerprofile',
            name='first_name',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='customerprofile',
            name='last_name',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='ordermaster',
            name='order_status',
            field=models.CharField(choices=[('Order booked', 'Order booked'), ('cancel', 'cancel'), ('delivered', 'delivered'), ('Prepare for dishpatch', 'Prepare for dishpatch'), ('On the way', 'On the way')], default='Order booked', max_length=50),
        ),
        migrations.AlterField(
            model_name='ordermaster',
            name='payment_id',
            field=models.CharField(blank=True, default='', max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='ordermaster',
            name='payment_request_id',
            field=models.CharField(blank=True, default='', max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='ordermaster',
            name='payment_status',
            field=models.CharField(choices=[('Credit', 'Credit'), ('Failed', 'Failed'), ('Pending', 'Pending')], default='Pending', max_length=50),
        ),
        migrations.AlterField(
            model_name='product',
            name='sub_category',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='apps.subcategory'),
        ),
        migrations.AlterField(
            model_name='subcategory',
            name='name',
            field=models.CharField(default='', max_length=50),
        ),
    ]
