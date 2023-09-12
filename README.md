
# Django and Virtual Environment Management Scripts

**Author**: Mostafa Abdullhuq

---

## Description

This GitHub project provides two command-line shell scripts for managing Django projects and Python virtual environments:

- **django.sh**: A command-line tool for managing Django projects, including creating projects, creating apps, applying database migrations, and running the development server.
- **venv.sh**: A command-line tool for managing Python virtual environments, including creating, starting, stopping, generating `requirements.txt` files, listing installed packages, and installing new packages.

These scripts are designed to streamline common development tasks when working with Django and Python projects, making it easier to create, manage, and run your projects.

## Usage

### **django.sh**

To use the `django.sh` script, run it with one of the following commands:

- `project <project_name>`: Create a new Django project in the current directory.
- `app <app_name>`: Create a new Django app in the current directory.
- `migrate [app_name]`: Apply database migrations (optional app name).
- `run`: Start the Django development server.

#### Example Usage

```bash
# Create a new Django project
$ ./django.sh project myproject

# Create a new Django app
$ ./django.sh app myapp

# Apply migrations for all apps
$ ./django.sh migrate

# Apply migrations for a specific app
$ ./django.sh migrate myapp

# Start the Django server
$ ./django.sh run
```

### **venv.sh**

To use the `venv.sh` script, run it with one of the following commands:

- `create`: Create a new Python virtual environment in the current path.
- `start`: Activate the virtual environment.
- `stop`: Deactivate the virtual environment.
- `requirements`: Generate a `requirements.txt` file from installed packages.
- `list`: List installed packages in the virtual environment.
- `install <package_name>`: Install a new package via `pip`.

#### Example Usage

```bash
# Create a new virtual environment
$ ./venv.sh create

# Start the virtual environment
$ ./venv.sh start

# Stop the virtual environment
$ ./venv.sh stop

# Generate 'requirements.txt'
$ ./venv.sh requirements

# List installed packages
$ ./venv.sh list

# Install a new package
$ ./venv.sh install django~=4.0.0
```

## Author

- Mostafa Abdullhuq

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```