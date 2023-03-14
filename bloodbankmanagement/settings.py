import os
from typing import Dict, Any

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEMPLATE_DIR = os.path.join(BASE_DIR, 'templates')
STATIC_DIR = os.path.join(BASE_DIR, 'static')
MEDIA_ROOT = os.path.join(BASE_DIR, 'static')

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+zy!9k=9pql5gz9bkqjore)k6r!%w0atk(@(!(!zvp5e(t2i8n'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application definition

INSTALLED_APPS = [
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'widget_tweaks',
    'blood',
    'donor',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
CSRF_COOKIE_SECURE = False
ROOT_URLCONF = 'bloodbankmanagement.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATE_DIR, ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'bloodbankmanagement.wsgi.application'

# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'blood_bank',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [
    STATIC_DIR,
]
LOGIN_REDIRECT_URL = '/afterlogin'

# for contact us give your gmail id and password
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = 'from@gmail.com'  # this email will be used to send emails
EMAIL_HOST_PASSWORD = 'xyz'  # host email password required
# now sign in with your host gmail account in your browser
# open following link and turn it ON
# https://myaccount.google.com/lesssecureapps
# otherwise you will get SMTPAuthenticationError at /contactus
# this process is required because google blocks apps authentication by default
EMAIL_RECEIVING_USER = ['to@gmail.com']  # email on which you will receive messages sent from website

JAZZMIN_SETTINGS: Dict[str, Any] = {
    # title of the window (Will default to current_admin_site.site_title if absent or None)
    "site_title": "DIU BBMS Admin",
    # Title on the brand, and login screen (19 chars max) (defaults to current_admin_site.site_header if absent or None)
    "site_header": "DIU BBMS Admins",
    # Logo to use for your site, must be present in static files, used for brand on top left
    "site_logo": "logo.png",
    # CSS classes that are applied to the logo
    "site_logo_classes": None,
    # Relative path to a favicon for your site, will default to site_logo if absent (ideally 32x32 px)
    "site_icon": "favicon.png",
    # Welcome text on the login screen
    "welcome_sign": "Welcome to the DIU BBMS Admin",
    # Copyright on the footer
    "copyright": "DIU BBMS ",
    # The model admin to search from the search bar, search bar omitted if excluded
    "search_model": "auth.User",
    # Field name on user model that contains avatar ImageField/URLField/Charfield or a callable that receives the user
    "user_avatar": None,
    ############
    # Top Menu #
    ############
    # Links to put along the top menu
    "topmenu_links": [
        # Url that gets reversed (Permissions can be added)
        {"name": "Home", "url": "admin:index", "permissions": ["auth.view_user"]},
        # external url that opens in a new window (Permissions can be added)
        {"name": "Support", "url": "#", "new_window": True},
        # model admin to link to (Permissions checked against model)
        {"model": "auth.User"},
        # App with dropdown menu to all its models pages (Permissions checked against models)
        {"app": "books"},
        {"app": "loans"},
    ],
    #############
    # User Menu #
    #############
    # Additional links to include in the user menu on the top right ('app' url type is not allowed)
    "usermenu_links": [
        {"name": "Support", "url": "#", "new_window": True},
        {"model": "auth.user"},
    ],
    #############
    # Side Menu #
    #############
    # Whether to display the side menu
    "show_sidebar": True,
    # Whether to aut expand the menu
    "navigation_expanded": True,
    # Hide these apps when generating side menu e.g (auth)
    "hide_apps": [],
    # Hide these models when generating side menu (e.g auth.user)
    "hide_models": [],
    # List of apps to base side menu (app or model) ordering off of
    "order_with_respect_to": ["Make Messages", "auth", "books", "books.author", "books.book", "loans"],
    # Custom links to append to app groups, keyed on app name
    "custom_links": {
        "loans": [
            {
                "name": "Make Messages",
                "url": "make_messages",
                "icon": "fas fa-comments",
                "permissions": ["loans.view_loan"],
            },
            {"name": "Custom View", "url": "admin:custom_view", "icon": "fas fa-box-open"},
        ]
    },
    # Custom icons for side menu apps/models See the link below
    # https://fontawesome.com/icons?d=gallery&m=free&v=5.0.0,5.0.1,5.0.10,5.0.11,5.0.12,5.0.13,5.0.2,5.0.3,5.0.4,5.0.5,5.0.6,5.0.7,5.0.8,5.0.9,5.1.0,
    # 5.1.1,5.2.0,5.3.0,5.3.1,5.4.0,5.4.1,5.4.2,5.13.0,5.12.0,5.11.2,5.11.1,5.10.0,5.9.0,5.8.2,5.8.1,5.7.2,5.7.1,5.7.0,5.6.3,5.5.0,5.4.2
    # for the full list of 5.13.0 free icon classes
    "icons": {
        "auth": "fas fa-users-cog",
        "auth.user": "fas fa-user",
        "auth.Group": "fas fa-users",
        "admin.LogEntry": "fas fa-file",
        # "blogs.Post": "fas fa-blog",
        # "blogs.PostComment": "fas fa-comment",
        # "core.InquiryRequest": "fas fa-question-circle",
        # "core.Membership": "fas fa-id-badge",
        # "core.Newsletter": "fas fa-file-alt",
        # "core.Profile": "fas fa-user",
        # "core.RefundRequest": "fas fa-undo-alt",
        # "core.PaymentGatewaySettings": "fas fa-key",
        # "core.Settings": "fas fa-cogs",
        # "core.Subscriber": "fas fa-check-double",
        # "core.Transaction": "fas fa-money-check-alt",
        # "core.Webinar": "fas fa-video",
        # "core.WebinarRegistration": "fas fa-user-check",
        # "course.cart": "fas fa-shopping-cart",
        # "course.Categories": "fas fa-th-large",
        # "course.Course": "fas fa-photo-video",
        # "course.EnrolledCourse": "fas fa-plus-square",
        # "course.Enrolled": "fas fa-cart-plus",
        # "course.Lecture": "fas fa-chalkboard-teacher",
        # "course.LiveCourseBatch": "fas fa-file-video",
        # "course.Quiz": "fas fa-question-circle",
        # "course.Review": "fas fa-star-half-alt",
        # "course.Section": "fas fa-server",
        # "course.SubCategories": "fas fa-th",
        # "enterprise.RequestDemo": "fas fa-laptop-code",
        # "enterprise.Review": "fas fa-star-half-alt",
        # "instructor.InstructorEarning": "fas fa-hand-holding-usd",
        # "instructor.InstructorLevel": "fas fa-signal",
        # "instructor.InstructorWithdrawRequest": "fas fa-file-import",
        # "instructor.PaymentWithdrawCredentials": "fas fa-file-alt",
        # "instructor.WithdrawStatement": "fas fa-file-invoice-dollar",
        # "job.Applicants": "fas fa-user-check",
        # "job.CompanyDetails": "fas fa-briefcase",
        # "job.JobCategories": "fas fa-th-large",
        # "job.JobSubCategories": "fas fa-th",
        # "job.Job": "fas fa-business-time",
        # "notifications.notification": "fas fa-bell",
        # "social_django.association": "fas fa-share-alt",
        # "social_django.nonce": "fas fa-poll-h",
        # "social_django.usersocialauth": "fas fa-user-friends",
        # "django_simple_coupons.couponuser": "fas fa-user-circle",
        # "django_simple_coupons.coupon": "fas fa-compass",
        # "django_simple_coupons.discount": "fas fa-percentage",
        # "django_simple_coupons.ruleset": "fas fa-hammer",
        # "skillsolympiad.olympiadattempt": "fas fa-tasks",
        # "skillsolympiad.olympiadcertificate": "fas fa-certificate",
        # "skillsolympiad.olympiadenroll": "fas fa-user-check",
        # "skillsolympiad.olympiadquiz": "fas fa-list-alt",
        # "skillsolympiad.quizcategories": "fas fa-clipboard-list",
        # "student.certificate": "fas fa-certificate",
        # "student.skillspurchase": "fas fa-credit-card",
        # "student.skillsreview": "fas fa-star",
        # "student.skills": "fas fa-code-branch",
        # "student.Messages": "fab fa-facebook-messenger",
    },
    # Icons that are used when one is not manually specified
    "default_icon_parents": "fas fa-chevron-circle-right",
    "default_icon_children": "fas fa-circle",
    #################
    # Related Modal #
    #################
    # Activate Bootstrap modal
    "related_modal_active": False,
    #############
    # UI Tweaks #
    #############
    # Relative paths to custom CSS/JS scripts (must be present in static files)
    "custom_css": None,
    "custom_js": None,
    # Whether to show the UI customizer on the sidebar
    "show_ui_builder": True,
    ###############
    # Change view #
    ###############
    # Render out the change view as a single form, or in tabs, current options are
    # - single
    # - horizontal_tabs (default)
    # - vertical_tabs
    # - collapsible
    # - carousel
    "changeform_format": "horizontal_tabs",
    # override change forms on a per modeladmin basis
    "changeform_format_overrides": {"auth.user": "collapsible", "auth.group": "vertical_tabs"},
    # Add a language dropdown into the admin
    "language_chooser": True,
}
