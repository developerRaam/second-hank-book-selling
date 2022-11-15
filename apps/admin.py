from django.contrib import admin
from .models import *
from django.utils.html import format_html
# Register your models here.


class CategoryAdmin(admin.ModelAdmin):
    list_display = ("name","image")
admin.site.register(Category,CategoryAdmin)


class SubCategoryAdmin(admin.ModelAdmin):
    list_display = ("name","cat_id","sub_image")
admin.site.register(SubCategory,SubCategoryAdmin)



# Insert multiple images
class ProductImageAdmin(admin.StackedInline):
    model = ProductImage
    
class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductImageAdmin] # multiple images reference
    class Meta:
        models=Product
    
    def image_tag(self, obj):
        return format_html('<img src="{}" style="max-width:70px; max-height:70px"/>'.format(obj.product_image.url))
    list_display = ("product_name","image_tag","categoryId","sub_category","product_price","product_mrp","created_at")
    
admin.site.register(Product,ProductAdmin)

# @admin.register(ProductImage)
# class ProductImageAdmin(admin.ModelAdmin):
#     pass

class ProductImageAdmin(admin.ModelAdmin):
    def image_tag(self, obj):
        return format_html('<img src="{}" style="max-width:70px; max-height:70px"/>'.format(obj.image.url))
    list_display = ("product_name","image_tag","product_name_id")
admin.site.register(ProductImage,ProductImageAdmin)


class CustomerProfileAdmin(admin.ModelAdmin):
    list_display = ("first_name","last_name","mobile","email","status_at","created_at")
admin.site.register(CustomerProfile, CustomerProfileAdmin)


class OrderMasterAdmin(admin.ModelAdmin):
    pass
admin.site.register(OrderMaster)


class OrderItemAdmin(admin.ModelAdmin):
    list_display=("order_id","product_id","price","quantity","created_at")
admin.site.register(OrderItem,OrderItemAdmin)
