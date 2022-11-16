from django.shortcuts import render,redirect,HttpResponse
from .models import *
from django.contrib import messages
from django.contrib.auth import login, authenticate
from django.contrib.auth.models import auth
import random
from django.db import connection
from django.conf import settings
from instamojo_wrapper import Instamojo
from django.contrib.auth.hashers import make_password,check_password

# Instamojo setup
api = Instamojo(api_key=settings.API_KEY, auth_token=settings.AUTH_TOKEN, endpoint='https://test.instamojo.com/api/1.1/')



# Create your views here.

#==============================  About  ==========================================
def About(request):
    if request.session.has_key('user_email'):
        user_email=request.session['user_email']
        customer_name = request.session['customer_name']
        cart_count = Cart.objects.all().count()
        context ={
            "user_login":user_email,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        return render(request, "apps/about.html",context)
    else:
        return render(request, "apps/about.html")

#============================== Contact us ==========================================
def Contact(request):
    if request.session.has_key('user_email'):
        user_email=request.session['user_email']
        customer_name = request.session['customer_name']
        cart_count = Cart.objects.all().count()
        context ={
            "user_login":user_email,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        return render(request, "apps/contact.html",context)
    else:
        return render(request, "apps/contact.html")

#==============================  Home ==========================================
def Home(request):
    product = Product.objects.all().order_by('-id')[:300]
    category = Category.objects.all()
    sub_category = SubCategory.objects.all()
    
    context={
        "product_data":product,
        "category":category,
        "sub_category":sub_category
    }
    
    if request.session.has_key('user_email'):
        user_email=request.session['user_email']
        customer_name = request.session['customer_name']
        cart_count = Cart.objects.all().count()
        context ={
            "user_login":user_email,
            "customer_name":customer_name,
            "product_data":product,
            "category":category,
            "sub_category":sub_category,
            "cart_count":cart_count
        }
        return render(request, "apps/home.html",context)
    else:
        return render(request, "apps/home.html",context)
    
#=======================================================================================
def Shops(request, cat_id, sub_cat_id, sub_slug):
    product = Product.objects.filter(categoryId=cat_id, sub_category=sub_cat_id)
    category = Category.objects.all()
    sub_category = SubCategory.objects.all()
    
    context={
        "product_data":product,
        "category":category,
        "sub_category":sub_category
    }
    
    if request.session.has_key('user_email'):
        user_email=request.session['user_email']
        customer_name = request.session['customer_name']
        cart_count = Cart.objects.all().count()
        context ={
            "user_login":user_email,
            "customer_name":customer_name,
            "product_data":product,
            "category":category,
            "sub_category":sub_category,
            "cart_count":cart_count
        }
        return render(request, "apps/shop.html",context)
    else:
        return render(request, "apps/shop.html",context)

#========================= show Product by Category =========================
def ShowProductByCategory(request, cat_id, cat_slug):
    product = Product.objects.filter(categoryId=cat_id)
    category = Category.objects.all()
    sub_category = SubCategory.objects.all()
    context={
        "product_data":product,
        "category":category,
        "sub_category":sub_category,
    }
    
    if request.session.has_key('user_email'):
        user_email=request.session['user_email']
        customer_name = request.session['customer_name']
        cart_count = Cart.objects.all().count()
        context ={
            "user_login":user_email,
            "customer_name":customer_name,
            "product_data":product,
            "category":category,
            "cart_count":cart_count,
            "sub_category":sub_category,
        }
        return render(request, "apps/show-product-by-category.html",context)
    else:
        return render(request, "apps/show-product-by-category.html",context)

#==============================  Order details ==========================================
def Details(request,pk,prd_slug):
    res1 = Product.objects.get(id=pk)
    res2 = ProductImage.objects.filter(product_name_id=pk)
    sub_category = SubCategory.objects.all()
    category = Category.objects.all()
    
    # show releted product
    prd = res1.product_name
    slc = slice(15)
    releted_prd = Product.objects.filter(product_name__icontains=str(prd[slc])).order_by("product_name")[:40]
    
    if request.session.has_key('user_email'):
        session=request.session['user_email']
        customer_name = request.session['customer_name']
        res3 = CustomerProfile.objects.get(email=session)
        cart_count = Cart.objects.all().count()
        context ={
            'product_id':res1,
            'multi_images':res2,
            'user_login':session,
            'user_profile':res3,
            "customer_name":customer_name,
            "sub_category":sub_category,
            "category":category,
            "releted_prd":releted_prd,
            "cart_count":cart_count
        }
        return render(request, "apps/details.html",context)
    else:
        context ={
            'product_id':res1,
            'multi_images':res2,
            "sub_category":sub_category,
            "category":category,
            "releted_prd":releted_prd

        }
        return render(request, "apps/details.html",context)

    
#==============================  User authontication ==========================================
# User Registration
def Register(request):
    if request.session.has_key('user_email'):
        return redirect('/user')
    else:
        if request.method == 'POST':
            first_name = request.POST['first_name']
            last_name = request.POST['last_name']
            mobile = request.POST['mobile']
            email = request.POST['email']

            password = make_password(request.POST['password'])
            

            if CustomerProfile.objects.filter(email=email).exists():
                messages.warning(request, "Email already exists")
                return redirect('register')
            else:
                user = CustomerProfile.objects.create(first_name=first_name,last_name=last_name,mobile=mobile,email=email,password=password)
                user.save()
                messages.success(request, "User created successful")
                return redirect('login')
        else:
            return render(request, 'apps/register.html')

#=========================== User login page ========================
def CustomerLogin(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        user = CustomerProfile.objects.filter(email=email)
        if user:
            user = CustomerProfile.objects.get(email=email)
            encodepass = user.password
            cust_email = user.email
            customer_id = user.id
            customer_name = user.first_name
            decodepass = check_password(password, encodepass)

            if cust_email == email and decodepass == True:
                if user.status_at == "Enable":
                    request.session['customer_id']=customer_id
                    request.session['user_email']=email
                    request.session['customer_name']=customer_name
                    messages.success(request,"Login success")
                    return redirect('/user')
                else:
                    messages.warning(request, "Your account is desable. Please forgot your password")
                    return redirect('/login') 
            else:
                messages.warning(request, 'Invalid credentials')
                return redirect('/login')
        else:
            messages.warning(request, "Invalid credentials")
            return redirect('/login')
    else:
        # Session already login
        if request.session.has_key('user_email'):
            return redirect('/user')
        else:
            return render(request, 'apps/login.html')

# =================== User Home =======================
def UserHome(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        product = Product.objects.all().order_by('-id')
        category = Category.objects.all()
        sub_category = SubCategory.objects.all()
        cart_count = Cart.objects.all().count()
        context={
            'user_login':session,
            "product_data":product,
            "customer_name":customer_name,
            "category":category,
            "sub_category":sub_category,
            "cart_count":cart_count
        }
        return render(request, "apps/user.html",context)
    else:
        return redirect('/login')

#======================== Logout ===========================
def Logout(request):
    del request.session['user_email']
    return redirect('/login')


#========================== User Profile ======================
def UserAccount(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        res = CustomerProfile.objects.get(email=session)
        cart_count = Cart.objects.all().count()
        context={
            'user_profile':res,
            'user_login':session,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        return render(request, "apps/user_account.html",context)
    else:
        return redirect('/login')

#======================== Update Account ===============================
def UpdateAccount(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        res = CustomerProfile.objects.get(email=session)
        cart_count = Cart.objects.all().count()

        context={
            'user_profile':res,
            'user_login':session,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        if request.method == 'POST':
            fname = request.POST.get('fname')
            lname = request.POST.get('lname')
            mobile = request.POST.get('mobile')
            
            print(fname, lname, mobile)

            profile_update = CustomerProfile.objects.get(email=session)
            profile_update.first_name=fname
            profile_update.last_name=lname
            profile_update.mobile=mobile
            profile_update.save()
            if profile_update:
                messages.success(request, "Profile Successfully Updated")
                return redirect('/user-account')
            else:
               messages.success(request, "Profile Updatedation failed")
               return redirect('/user-account') 
        else:
           return render(request, "apps/user-account-update.html",context)
       
        return render(request, "apps/user-account-update.html",context)
    else:
        return redirect('/login')

#================= Add To Cart =================================
def AddToCart(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        user_id = CustomerProfile.objects.get(email=session)
        user = user_id.id
        if request.method == 'POST':
            user_id = user
            product_id = request.POST.get('product_id')
            quantity = request.POST.get('quantity')

            # Check for product already present or not
            old_data = Cart.objects.filter(user_id=user, product_id=product_id)
            if old_data:
                update = Cart.objects.get(user_id=user,product_id=product_id)
                qty = update.quantity
                update.quantity=int(qty) + int(quantity)
                update.save()
                messages.success(request, "Item updated to cart")
                return redirect('cart')
            else:    
                cart = Cart.objects.create(user_id_id=user_id,product_id_id=product_id,quantity=quantity)
                cart.save()
                messages.success(request, "Item added to cart")
                return redirect('cart')
        else:
            return redirect('/user')
    else:
        return redirect('/user')
    


#================= Cart =================================
def CartShow(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        user_id = CustomerProfile.objects.get(email=session)
        user_id = user_id.id
        cart = Cart.objects.filter(user_id_id=user_id)
        cart_count = Cart.objects.all().count()
        context={
            'user_login':session,
            'user_id':user_id,
            'cart_data':cart,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        return render(request, "apps/cart.html",context)
    else:
        return redirect('/login')



#========================== Ordered ======================
def Ordered(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        user = CustomerProfile.objects.get(email=session)
        user_id = user.id

        if connection.cursor():
            cursor = connection.cursor()
            cursor.execute("SELECT apps_orderitem.id,apps_product.product_image,apps_product.product_name,apps_product.product_price,apps_orderitem.quantity,apps_ordermaster.payment_mode,apps_ordermaster.payment_status,apps_ordermaster.order_status,apps_ordermaster.created_at,apps_orderitem.product_id_id FROM apps_ordermaster, apps_orderitem,apps_product WHERE apps_ordermaster.id=apps_orderitem.order_id_id and apps_product.id=apps_orderitem.product_id_id and apps_ordermaster.user_id_id=%s order by apps_orderitem.id desc",[user_id])
            results = cursor.fetchall()
            cart_count = Cart.objects.all().count()
            context={
                'user_login':session,
                'order_item':results,
                "customer_name":customer_name,
                "cart_count":cart_count
            }
            return render(request, "apps/ordered.html",context)
        else:
            context={
                'user_login':session,
                "customer_name":customer_name,
            }
            return render(request, "apps/ordered.html",context)
    else:
        return redirect('/login')

#======================== Order detail ========================
def OrderedDetail(request, prd_id, prd_slug):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        
        order_item = OrderItem.objects.get(id=prd_id)
        product = Product.objects.get(id=order_item.product_id_id)
        order_master = OrderMaster.objects.get(id=order_item.order_id_id)
        cart_count = Cart.objects.all().count()
        context={
            'user_login':session,
            "customer_name":customer_name,
            "order_item":order_item,
            "product":product,
            "order_master":order_master,
            "cart_count":cart_count
        }
        return render(request, "apps/ordered_detail.html",context)
    else:
        return redirect('/login')


#====================== delete order from cart ======================
def DeleteItemToCart(request, item_id):
    Cart.objects.filter(product_id=item_id).delete()
    return redirect('/cart')



# ============== Update cart item quantity =============
def quantityAdd(request, user_id, item_id):
    update = Cart.objects.get(user_id=user_id, product_id=item_id)
    qty = update.quantity
    update.quantity=int(qty) + 1
    update.save()
    return redirect('/cart')

def quantityMinus(request, user_id, item_id):
    update = Cart.objects.get(user_id=user_id, product_id=item_id)
    qty = update.quantity
    if int(qty) > 1:
        update.quantity=int(qty) - 1
        update.save()
        return redirect('/cart')
    else:
        messages.warning(request, "Invalid Request")
        return redirect('/cart')




# ============== Checkout single item =============
def CheckoutSingleOrder(request, order_id,prd_slug):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        res1 = CustomerProfile.objects.get(email=session)
        user = res1.id
        user_name = res1.first_name
        Show_order = Product.objects.get(id=order_id)
        cart_count = Cart.objects.all().count()
        context={
            'user_login':session,
            'Show_order':Show_order,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        if request.method == 'POST':
            user_id = request.user
            name = request.POST.get('name')
            mobile = request.POST.get('mobile')
            house_no = request.POST.get('house_no')
            address = request.POST.get('address')
            country = request.POST.get('country')
            state = request.POST.get('state')
            city = request.POST.get('city')
            pincode = request.POST.get('pincode')
            payment_mode = request.POST.get('payment_mode')

            #Count total price
            order = Product.objects.get(id=order_id)
            order = order.product_price

            # Generate tracking no
            trackno = 'order'+str(random.randint(1111111, 9999999))
            while OrderMaster.objects.filter(tracking_no=trackno) is None:
                trackno = 'order'+str(random.randint(1111111, 9999999))
            tracking_no = trackno
            
            # Place order
            ordermaster = OrderMaster.objects.create(user_id_id=user,name=name,mobile=mobile,house_no=house_no,address=address,country=country,state=state,city=city,pincode=pincode,payment_mode=payment_mode,total_price=order,tracking_no=tracking_no)
            ordermaster.save()

            master_id = ordermaster.id
            name = ordermaster.name
            
            quantity=1

            if payment_mode == "pod":
                #======= New Order item ========
                new_order = Product.objects.get(id=order_id)
                
                orderitem = OrderItem.objects.create(order_id_id=ordermaster.id,
                    product_id_id=order_id,price=new_order.product_price,quantity=quantity)
                orderitem.save()
                messages.success(request, "Your order has been placed successfully",tracking_no)
                return redirect('/user')
            
            if payment_mode == "online": 
                #======= New Order item ========
                new_order = Product.objects.get(id=order_id)
                
                orderitem = OrderItem.objects.create(order_id_id=ordermaster.id,
                    product_id_id=order_id,price=new_order.product_price,quantity=quantity)
                orderitem.save()
                try:    
                    response = api.payment_request_create(
                    amount=order,
                    purpose='Order Process',
                    buyer_name=user_name,
                    email=session,
                    send_email= False,
                    redirect_url="http://127.0.0.1:8000/order-success/",
                    allow_repeated_payments= False
                    )
                    ordermaster.payment_request_id=response['payment_request']['id']
                    ordermaster.save()

                    context={
                        'payment_url':response['payment_request']['longurl'],
                        'user_login':session,
                        "customer_name":customer_name,
                    }

                    return render(request, 'apps/order-process.html',context)
                except Exception as e:
                    pass

        return render(request,"apps/checkout-single.html",context)
    else:
        return redirect('/login')


#====================== Checkout item ===========================
def CheckoutMultipleOrder(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']
        res1 = CustomerProfile.objects.get(email=session)
        user = res1.id
        user_name = res1.first_name
        cart = Cart.objects.filter(user_id_id=user)
        cart_count = Cart.objects.all().count()

        cart_total = 0
        for item in cart:
            cart_total = int(cart_total) + int(item.product_id.product_price) * int(item.quantity)
        total = cart_total

        context={
            'user_login':session,
            'cart_data':cart,
            'total':total,
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        if request.method == 'POST':
            user_id = request.user
            name = request.POST.get('name')
            mobile = request.POST.get('mobile')
            house_no = request.POST.get('house_no')
            address = request.POST.get('address')
            country = request.POST.get('country')
            state = request.POST.get('state')
            city = request.POST.get('city')
            pincode = request.POST.get('pincode')
            payment_mode = request.POST.get('payment_mode')

            #Count total price
            cart = Cart.objects.filter(user_id_id=user)
            cart_total_price = 0
            for item in cart:
                cart_total_price = int(cart_total_price) + int(item.product_id.product_price) * int(item.quantity)
            total_price = cart_total_price

            # Generate tracking no
            trackno = 'order'+str(random.randint(1111111, 9999999))
            while OrderMaster.objects.filter(tracking_no=trackno) is None:
                trackno = 'order'+str(random.randint(1111111, 9999999))
            tracking_no = trackno
            
            # Place order
            ordermaster = OrderMaster.objects.create(user_id_id=user,name=name,mobile=mobile,house_no=house_no,address=address,country=country,state=state,city=city,pincode=pincode,payment_mode=payment_mode,total_price=total_price,tracking_no=tracking_no)
            ordermaster.save()

            if payment_mode == "pod":
                #======= New Order item ========
                new_order_item = Cart.objects.filter(user_id=user)
                for item in new_order_item:
                    orderitem = OrderItem.objects.create(order_id=ordermaster,
                    product_id=item.product_id,price=item.product_id.product_price,quantity=item.quantity)
                # clear user cart
                Cart.objects.filter(user_id_id=user).delete()

                messages.success(request, "Your order has been placed successfully",tracking_no)
                return redirect('/user')
            
            if payment_mode == "online": 
                #======= New Order item ========
                new_order_item = Cart.objects.filter(user_id=user)
                for item in new_order_item:
                    orderitem = OrderItem.objects.create(order_id=ordermaster,
                    product_id=item.product_id,price=item.product_id.product_price,quantity=item.quantity)
                orderitem.save()
                # clear user cart
                Cart.objects.filter(user_id_id=user).delete()
                try:    
                    response = api.payment_request_create(
                    amount=total_price,
                    purpose='Order Process',
                    buyer_name=user_name,
                    email=session,
                    send_email= False,
                    redirect_url="http://127.0.0.1:8000/order-success/",
                    allow_repeated_payments= False
                    )
                    ordermaster.payment_request_id=response['payment_request']['id']
                    ordermaster.save()

                    context={
                        'payment_url':response['payment_request']['longurl'],
                        'user_login':session,
                        "customer_name":customer_name,
                    }

                    return render(request, 'apps/order-process.html',context)
                except Exception as e:
                    pass
        return render(request,"apps/checkout-multiple.html",context)
    else:
        return redirect('/login')
        

# ============== Order Payment process =============
def OrderSuccess(request):
    if request.session.has_key('user_email'):
        session = request.session['user_email']
        customer_name = request.session['customer_name']

        payment_request_id = request.GET.get('payment_request_id')
        payment_id = request.GET.get('payment_id')
        payment_status = request.GET.get('payment_status')
        cart_count = Cart.objects.all().count()
        context={
            'user_login':session,
            'payment_status':payment_status,
            "customer_name":customer_name,
            "cart_count":cart_count
        }

        if payment_request_id:
            order_master = OrderMaster.objects.get(payment_request_id=payment_request_id)
            order_master.payment_id=payment_id
            order_master.payment_status=payment_status
            order_master.save()
            
            return render(request, "apps/order-success.html",context)
        else:
            return redirect('/')
    else:
        return redirect('/login')


#==================== Forgot ================================
def Forgot(request):
    return render(request, "apps/forgot.html")

#=================== Change Password ========================
def ChangePassword(request):
    if request.session.has_key('user_email'):
        customer_name = request.session['customer_name']
        session = request.session['user_email']
        cart_count = Cart.objects.all().count()
        context ={
            "customer_name":customer_name,
            "cart_count":cart_count
        }
        customer = CustomerProfile.objects.get(email=session)
        password = customer.password

        if request.method == 'POST':
            old_password = request.POST['old_Password']
            new_Password = request.POST['new_Password']
            re_Password = request.POST['re_Password']

            #Check password (old password to new password)
            o_password = check_password(old_password, password)

            if new_Password == re_Password:
                if o_password == True:
                    n_password = make_password(new_Password)
                    update_password = CustomerProfile.objects.get(email=session)
                    update_password.password=n_password
                    update_password.save()
                    messages.success(request, "Password Successfuly Changed")
                    return redirect('change-password')
                else:
                    messages.warning(request, "password not match")
                    return redirect('change-password')
            else:
                messages.warning(request, "password not match")
                return redirect('change-password')
        else:
            return render(request, "apps/change-password.html",context)
    else:
        return redirect('/login')
    
    
def Searching(request):
    if request.method == 'GET':
        search_bar = request.GET['q']
        if search_bar == "":
            return redirect('/')
        else:
            search_data = Product.objects.filter(product_name__icontains=search_bar)
            product = Product.objects.all().order_by('-id')
            category = Category.objects.all()
            sub_category = SubCategory.objects.all()
            cart_count = Cart.objects.all().count()
            context={
                "product_data":search_data,
                "category":category,
                "sub_category":sub_category,
                "search_bar":search_bar,
                "cart_count":cart_count
            }
            return render(request, "apps/search.html", context)
    else:
        HttpResponse("page not found")