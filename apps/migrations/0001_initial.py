# Generated by Django 4.1.1 on 2022-10-21 16:36

import autoslug.fields
from django.db import migrations, models
import django.db.models.deletion
import tinymce.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', autoslug.fields.AutoSlugField(editable=False, populate_from='name', unique=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='category/')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='CustomerProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=20)),
                ('mobile', models.CharField(max_length=12)),
                ('email', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=255)),
                ('status_at', models.CharField(choices=[('Desable', 'Desable'), ('Enable', 'Enable')], default='Enable', max_length=10)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=255)),
                ('product_image', models.ImageField(upload_to='products/')),
                ('product_price', models.IntegerField()),
                ('product_mrp', models.IntegerField()),
                ('product_desc', tinymce.models.HTMLField(blank=True, null=True)),
                ('slug', autoslug.fields.AutoSlugField(editable=False, populate_from='product_name', unique=True)),
                ('created_at', models.DateTimeField()),
                ('categoryId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.category')),
            ],
        ),
        migrations.CreateModel(
            name='Whishlist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.product')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.customerprofile')),
            ],
        ),
        migrations.CreateModel(
            name='SubCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', autoslug.fields.AutoSlugField(editable=False, populate_from='name', unique=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='sub_category/')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('cat_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.category')),
            ],
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='products/')),
                ('product_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.product')),
            ],
        ),
        migrations.CreateModel(
            name='OrderMaster',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('mobile', models.CharField(max_length=12)),
                ('house_no', models.CharField(blank=True, max_length=20, null=True)),
                ('address', models.TextField()),
                ('country', models.CharField(max_length=50)),
                ('state', models.CharField(max_length=50)),
                ('city', models.CharField(max_length=50)),
                ('pincode', models.CharField(max_length=6)),
                ('total_price', models.FloatField()),
                ('payment_mode', models.CharField(max_length=150)),
                ('payment_id', models.CharField(max_length=255)),
                ('payment_request_id', models.CharField(max_length=255)),
                ('payment_status', models.CharField(choices=[('Credit', 'Credit'), ('Pending', 'Pending'), ('Failed', 'Failed')], default='Pending', max_length=50)),
                ('order_status', models.CharField(choices=[('Order booked', 'Order booked'), ('Prepare for dishpatch', 'Prepare for dishpatch'), ('delivered', 'delivered'), ('cancel', 'cancel'), ('On the way', 'On the way')], default='Order booked', max_length=50)),
                ('tracking_no', models.CharField(max_length=150)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.customerprofile')),
            ],
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.FloatField()),
                ('quantity', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('order_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.ordermaster')),
                ('product_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.product')),
            ],
        ),
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.CharField(max_length=10)),
                ('product_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.product')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.customerprofile')),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('house_no', models.CharField(blank=True, max_length=20, null=True)),
                ('address', models.CharField(max_length=255)),
                ('country', models.CharField(max_length=50)),
                ('state', models.CharField(max_length=50)),
                ('city', models.CharField(max_length=50)),
                ('pincode', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apps.customerprofile')),
            ],
        ),
    ]
