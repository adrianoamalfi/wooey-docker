#!/bin/bash
set -e
DIR="/code/wooeyp/wooeyp"

if [ "$1" = 'start' ]; then 
    if [ -d "$DIR" ]; then
        ### Take action if $DIR exists ###
        echo "Folder ${DIR} exist..."
        echo "Run python manage scripts..."
        cd wooeyp
        python manage.py makemigrations
        python manage.py migrate                  # Apply database migrations
        python manage.py collectstatic --noinput  # Collect static files
        mv /Procfile .
    else
        echo "Folder ${DIR} not exist..."
        echo "Installing files in ${DIR}..."
        ###  Control will jump here if $DIR does NOT exists ###      
        echo "Installing creating Wooify project ${DIR}..."
        wooify -p wooeyp && cd wooeyp
        python manage.py makemigrations
        python manage.py migrate                  # Apply database migrations
        python manage.py collectstatic --noinput  # Collect static files       
        echo "Installing creating Superuser (admin:chageme)..."
        python -c "import django; django.setup(); from django.contrib.auth.management.commands.createsuperuser import get_user_model; get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( username='$DJANGO_SU_NAME', email='$DJANGO_SU_EMAIL', password='$DJANGO_SU_PASSWORD')" # buildkit 418kB buildkit.dockerfile.v0
        mv /Procfile .
    fi
    exec honcho "$@"
fi

exec "$@"