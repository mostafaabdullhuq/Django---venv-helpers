#!/bin/bash
#
# Author: Mostafa Abdullhuq
# Description: This shell script is a command-line tool for managing Python virtual environments.
# It provides several commands to create, start, stop, generate requirements,
# list installed packages, and install new packages in a virtual environment.
#
# Usage: venv <create|start|stop|requirements|list|install|create|--help|-h> [options]
#

USAGE="[+] Usage: venv <create|start|stop|requirements|list|install|create|--help> [options]"
VENV="${PWD}/.venv"

if [[ -z $1 ]]; then
	echo "[+] Please provide an option."
	echo "${USAGE}"
else
	#? Display the help message when using 'venv --help' or 'venv -h'
	if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
		echo "${USAGE}"
		echo ""
		echo "[+] This function provides a set of commands to manage a Python virtual environment."
		echo ""
		echo "Options:"
		echo "  start          : Activate the virtual environment."
		echo "  stop           : Deactivate the virtual environment."
		echo "  requirements   : Generate a 'requirements.txt' file from installed packages."
		echo "  list           : List installed packages in the virtual environment."
		echo "  install           : Install dependency via pip."
		echo ""
		echo "[+] Example usage:"
		echo "  To create a new virtual environment:"
		echo "  $ venv create"
		echo ""
		echo "  To start the virtual environment:"
		echo "  $ venv start"
		echo ""
		echo "  To stop the virtual environment:"
		echo "  $ venv stop"
		echo ""
		echo "  To generate 'requirements.txt':"
		echo "  $ venv requirements"
		echo ""
		echo "  To list installed packages:"
		echo "  $ venv list"
		echo ""
		echo "  To install a new package:"
		echo "  $ venv install django~=4.0.0"

	#? create new virtual environment in the current path
	elif [[ $1 == "create" ]]; then

		if python -m venv .venv; then
			echo "[+] Virtual environment created successfully."
		else
			echo "[+] Error: Virtual environment creation failed."
		fi

	#? start the virtual environment that in the current path
	elif [[ $1 == "start" ]]; then

		if source "${VENV}/bin/activate"; then
			echo "[+] Virtual environment started successfully."
		else
			echo "[+] Error: Virtual environment activation failed."
		fi

	#? stop the current running virtual environment
	elif [[ $1 == "stop" ]]; then
		if deactivate; then
			echo "[+] Virtual environment stopped successfully."
		else
			echo "[+] Error: Virtual environment deactivation failed."
		fi

	#? install a new package via pip in the current environment
	elif [[ $1 == "install" ]]; then
		if [[ -z $2 ]]; then
			echo "[+] Please provide a package name."
			echo "[+] use venv --help for more help"
		else

			if python3 -m pip install "$2"; then
				echo "[+] Package installed successfully."
			else
				echo "[+] Error: Cannot install package $2."
			fi
		fi

	#? write dependencies of the current virtual environment in requirements.txt
	elif [[ $1 == "requirements" ]]; then
		pip freeze >./requirements.txt

	#? list the current virtual environment depenediences
	elif [[ $1 == "list" ]]; then
		pip freeze

	#? if another option given
	else
		echo "[+] Invalid option: $1"
		echo "${USAGE}"
	fi
fi
