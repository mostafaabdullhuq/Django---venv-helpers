#!/bin/bash
#
# Author: Mostafa Abdullhuq
# Description: This shell script is a command-line tool for managing django projects.
# It provides several commands to create project, create an app, migrate, and run server
#
# Usage: django <project|app|migrate|run|--help|-h> [options]
#

USAGE="[+] Usage: django [project|app|migrate|run|test|--help|-h] [options]"
PYTHON="./.venv/bin/python"

#? if no argument provided to venv
if [[ -z $1 ]]; then
	echo "[+] Please provide an option."
	echo "${USAGE}"
else
	#? Display the help message when using 'venv --help' or 'venv -h'
	if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
		echo "${USAGE}"
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
		echo ""
		echo "  To run tests in current project:"
		echo "  $ django test"
		echo ""
		echo "  To use custom django command:"
		echo "  $ django <your_command>"
	#? create new django project
	elif [[ $1 == "project" ]]; then
		if [[ -z $2 ]]; then
			echo "[+] Please provide project name."
			echo "[+] Use django --help or -h for more information."
		else

			if django-admin startproject "$2" .; then
				echo "[+] Project created successfully."
			else
				echo "[+] Error: Cannot execute command [django-admin startproject $2]."
			fi
		fi
	#? create new django app
	elif [[ $1 == "app" ]]; then
		if [[ -z $2 ]]; then
			echo "[+] Please provide app name."
			echo "[+] Use django --help or -h for more information."
		else
			if "${PYTHON}" manage.py startapp "$2"; then
				echo "[+] App created successfully."
			else
				echo "[+] Error: Cannot execute command [${PYTHON} manage.py startapp $2]."
			fi
		fi
	#? make database migrations
	elif [[ $1 == "migrate" ]]; then
		if [[ -z $2 ]]; then
			"${PYTHON}" manage.py migrate
		else
			if "${PYTHON}" manage.py migrate "$2"; then
				echo "[+] Migrations created successfully."
			else
				echo "[+] Error: Cannot execute command [${PYTHON} manage.py migrate $*]."
			fi
		fi

	#? run tests
	elif [[ $1 == "test" ]]; then
		if "${PYTHON}" manage.py test; then
			echo "[+] Tests ran successfully."
		else
			echo "[+] Error: Either tests cannot be run or tests failed."
		fi
	#? start server for django
	elif [[ $1 == "run" ]]; then
		if "${PYTHON}" manage.py runserver; then
			echo "[+] Django server started successfully."
		else
			echo "[+] Error: Cannot execute command [${PYTHON} manage.py runserver]."
		fi

	#? if another option given
	else
		if "${PYTHON}" manage.py "$@"; then
			echo "[+] Command: [${PYTHON} manage.py $*] executed successfully."
		else
			echo "[+] Error: Cannot execute command [${PYTHON} manage.py $*]."
		fi
	fi
fi
