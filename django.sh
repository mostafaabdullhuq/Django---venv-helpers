#!/bin/bash
#
# Author: Mostafa Abdullhuq
# Description: This shell script is a command-line tool for managing django projects.
# It provides several commands to create project, create an app, migrate, and run server
#
# Usage: django <project|app|migrate|run|--help|-h> [options]
#


USAGE="[+] Usage: django <project|app|migrate|run|--help|-h> [options]"




#? if no argument provided to venv
if [ -z "$1" ]; then
    echo "[+] Please provide an option."
    echo $USAGE
else
    #? Display the help message when using 'venv --help' or 'venv -h'
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo $USAGE
        echo ""
        echo "This script provides a set of commands to manage a Django project."
        echo ""
        echo "Commands:"
        echo "  project <project_name>  : Create a new Django project in the current directory."
        echo "  app <app_name>          : Create a new Django app in the current directory."
        echo "  migrate [app_name]      : Apply database migrations (optional app name)."
        echo "  run                     : Start the django default server."
        echo ""
        echo "Options:"
        echo "  --help, -h              : Display this help message and exit."
        echo ""
        echo "Example usage:"
        echo "  To create a new Django project:"
        echo "  $ django project myproject"
        echo ""
        echo "  To create a new Django app:"
        echo "  $ django app myapp"
        echo ""
        echo "  To apply migrations for all apps:"
        echo "  $ django migrate"
        echo ""
        echo "  To apply migrations for a specific app:"
        echo "  $ django migrate myapp"
        echo ""
        echo "  To run the django default server:"
        echo "  $ django run"
    #? create new django project
    elif [ "$1" = "project" ]; then
        if [ -z "$2" ]; then
            echo "[+] Please provide project name."
            echo "[+] Use django --help or -h for more information."
        else
            django-admin startproject $2 .
            if [ $? -eq 0 ]; then
                echo "[+] Project created successfully."
            else
                echo "[+] Error: Cannot create django project $2."
            fi
        fi
    #? create new django app
    elif [ "$1" = "app" ]; then
        if [ -z "$2" ]; then
            echo "[+] Please provide app name."
            echo "[+] Use django --help or -h for more information."
        else
            python manage.py startapp $2
            if [ $? -eq 0 ]; then
                echo "[+] Project created successfully."
            else
                echo "[+] Error: Cannot create django project $2."
            fi
        fi
    #? make database migrations
    elif [ "$1" = "migrate" ]; then
        if [ -z "$2" ]; then
            python manage.py migrate
        else
            python manage.py migrate $2
            if [ $? -eq 0 ]; then
                echo "[+] Project created successfully."
            else
                echo "[+] Error: Cannot create django project $2."
            fi
        fi
    #? start server for django
    elif [ "$1" = "run" ]; then
        python manage.py runserver
        if [ $? -eq 0 ]; then
            echo "[+] Django server started successfully."
        else
            echo "[+] Error: Cannot run django server."
        fi

    #? if another option given
    else
        echo "[+] Invalid option: $1"
        echo $USAGE
    fi
fi
