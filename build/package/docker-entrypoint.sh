#!/bin/bash
set -e

if [ "$1" = 'start' ]; then

    if [ -z "$(ls -A /wooeyp)" ]; then
        python manage.py makemigrations
        python manage.py migrate                  # Apply database migrations
        python manage.py collectstatic --noinput  # Collect static files
    fi

    exec honcho "$@"
fi

exec "$@"