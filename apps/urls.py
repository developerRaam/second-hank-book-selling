from django.urls import path
from django.contrib import admin
from .import views

admin.site.site_header = "Second Hand Book Selling"
admin.site.site_title = "Book Selling Admin Portal"
admin.site.index_title = "Welcome to Book Selling Portal"


urlpatterns = [
    path("",views.Home, name="home"),
    path("detail/<int:pk>/<prd_slug>",views.Details, name="detail"),
    path("login/",views.CustomerLogin, name="login"),
    path("register/",views.Register, name="register"),
    path("user/",views.UserHome, name="user"),
    path("logout/",views.Logout, name="logout"),
    path("about/",views.About, name="about"),
    path("contact/",views.Contact, name="contact"),
    path("cart/",views.CartShow, name="cart"),
    path("user-account/",views.UserAccount, name="user-account"),
    path("checkout-multiple/",views.CheckoutMultipleOrder, name="checkout-multiple"),
    path("checkout-order/<order_id>/<prd_slug>",views.CheckoutSingleOrder, name="checkout-single"),
    path("add-to-cart/",views.AddToCart, name="add-to-cart"),
    path("ordered/",views.Ordered, name="ordered"),
    path("order/<prd_id>/<prd_slug>", views.OrderedDetail, name="ordered-detail"),
    path("delete-from-cart/<item_id>",views.DeleteItemToCart, name="delete-from-cart"),
    path("quantity-inc/<user_id>/<item_id>",views.quantityAdd, name="qty-add"),
    path("quantity-dec/<user_id>/<item_id>",views.quantityMinus, name="qty-minus"),
    path("order-success/",views.OrderSuccess, name="order-success"),
    path("password-forgot/",views.Forgot, name="password-forgot"),
    path("change-password/", views.ChangePassword, name="change-password"),
    path("shop/<cat_id><sub_cat_id>/<sub_slug>/",views.Shops, name="shop"),
    path("shop/<cat_id>/<cat_slug>/",views.ShowProductByCategory, name="show-by-cat"),
    path("search",views.Searching, name="search")
]
