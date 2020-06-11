{% set is_open_source = cookiecutter.open_source_license != 'Not open source' -%}
# {{ cookiecutter.project_name }}

{% if is_open_source %}[![PyPI](https://img.shields.io/pypi/v/{{ cookiecutter.project_slug }}.svg)](https://pypi.python.org/pypi/{{ cookiecutter.project_slug }}){% if cookiecutter.use_travis_for_testing == 'y' %} [![Travis](https://img.shields.io/travis/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}.svg)](https://travis-ci.com/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}){% endif %} [![Docs](https://readthedocs.org/projects/{{ cookiecutter.project_slug | replace("_", "-") }}/badge/?version=latest)](https://{{ cookiecutter.project_slug | replace("_", "-") }}.readthedocs.io/en/latest/?badge=latest){%- endif %}

{{ cookiecutter.project_short_description }}

## Docker Quickstart

This app can be run completely using `Docker` and `docker-compose`. **Using Docker is recommended, as it guarantees the application is run using compatible versions of Python**. You can find out more at [Compose command-line reference](https://docs.docker.com/compose/reference/).

### Basics

To build and start a service running in background
```bash
docker-compose up -d service_name
```

To execute a command with a service container
```bash
docker-compose exec service_name [COMMAND]
```

To stop a service
```bash
docker-compose stop service_name
```

To stop and a service and remove its container
```bash
docker-compose down service_name
```

### Production

To run the production version of the project

```bash
docker-compose up -d prod
```

To run the {{ cookiecutter.project_slug }} module of the project

```bash
docker-compose exec prod python -m {{ cookiecutter.project_slug }}
```

### Development

To run the project development environment

```bash
docker-compose up -d dev
```

To execute {{ cookiecutter.project_slug }} development routines

```bash
# [FOLDERS] = folder1 folder2 folder3 (optional to limit validation)
docker-compose exec dev flake8 --max-complexity=10 [FOLDERS]
docker-compose exec dev pytest --cov={{ cookiecutter.project_slug }} [MODULES_FOLDER] [TESTS_FOLDER]
docker-compose exec dev python -m {{ cookiecutter.project_slug }}
```

{% if is_open_source %}* Free software: {{ cookiecutter.open_source_license }}
* Documentation: https://{{ cookiecutter.project_slug | replace("_", "-") }}.readthedocs.io.
{% endif %}

## Features

* TODO

## Credits
* {{ cookiecutter.full_name }} <{{ cookiecutter.email }}>
