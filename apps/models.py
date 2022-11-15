from django.db import models
from django.contrib.auth.models import User
from autoslug import AutoSlugField
from tinymce.models import HTMLField

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=50)
    slug = AutoSlugField(populate_from='name', unique=True)
    image = models.ImageField(upload_to="category/", null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class SubCategory(models.Model):
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, default="")
    slug = AutoSlugField(populate_from='name', unique=True, always_update=True)
    sub_image = models.ImageField(upload_to="sub_category/", null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Product(models.Model):
    categoryId = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_category = models.ForeignKey(SubCategory, on_delete=models.CASCADE, default="")
    product_name = models.CharField(max_length=255)
    product_image = models.ImageField(upload_to="products/")
    product_price = models.IntegerField()
    product_mrp = models.IntegerField()
    product_desc = HTMLField(null=True, blank=True)
    slug = AutoSlugField(populate_from='product_name', unique=True)
    created_at = models.DateTimeField()

    def __str__(self):
        return self.product_name

class ProductImage(models.Model):
    product_name = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to="products/")

    def __str__(self):
        return str(self.product_name)


class CustomerProfile(models.Model):
    first_name = models.CharField(max_length=20, null=True, blank=True)
    last_name = models.CharField(max_length=20, null=True, blank=True)
    mobile = models.CharField(max_length=12)
    email = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    choice = {
        ('Enable','Enable'),
        ('Desable','Desable'),
    }
    status_at = models.CharField(max_length=10,choices=choice, default="Enable")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.first_name
    

class Whishlist(models.Model):
    user_id = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)

class Cart(models.Model):
    user_id = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=10)

class Address(models.Model):
    user_id = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    house_no = models.CharField(max_length=20,blank=True, null=True)
    address = models.CharField(max_length=255)
    country = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    pincode = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

class OrderMaster(models.Model):
    user_id = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    mobile = models.CharField(max_length=12)
    house_no = models.CharField(max_length=20,blank=True, null=True)
    address = models.TextField(null=False)
    country = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    pincode = models.CharField(max_length=6)
    total_price = models.FloatField(null=False)
    payment_mode = models.CharField(max_length=150, null=False)
    payment_id = models.CharField(max_length=255, blank=True, null=True, default="")
    payment_request_id = models.CharField(max_length=255, blank=True, null=True, default="")
    
    paymentStatus = {
        ('Pending','Pending'),
        ('Failed','Failed'),
        ('Credit','Credit')
    }
    payment_status = models.CharField(max_length=50,choices=paymentStatus,default='Pending')
    
    orderStatus = {
        ('Order booked','Order booked'),
        ('Prepare for dishpatch','Prepare for dishpatch'),
        ('On the way','On the way'),
        ('delivered','delivered'),
        ('cancel','cancel'),
    }
    order_status = models.CharField(max_length=50,choices=orderStatus, default='Order booked')
    tracking_no = models.CharField(max_length=150)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    


    
class OrderItem(models.Model):
    order_id = models.ForeignKey(OrderMaster, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    price = models.FloatField(null=False)
    quantity = models.IntegerField(null=False)
    created_at = models.DateTimeField(auto_now_add=True)