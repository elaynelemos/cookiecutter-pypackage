{% set is_open_source = cookiecutter.open_source_license != 'Not open source' -%}
# {{ cookiecutter.project_name }}

{% if is_open_source %}[![PyPI](https://img.shields.io/pypi/v/{{ cookiecutter.project_slug }}.svg)](https://pypi.python.org/pypi/{{ cookiecutter.project_slug }}){% if cookiecutter.use_travis_for_testing == 'y' %} [![Travis](https://img.shields.io/travis/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}.svg)](https://travis-ci.com/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}){% endif %} [![Docs](https://readthedocs.org/projects/{{ cookiecutter.project_slug | replace("_", "-") }}/badge/?version=latest)](https://{{ cookiecutter.project_slug | replace("_", "-") }}.readthedocs.io/en/latest/?badge=latest){%- endif %}

{{ cookiecutter.project_short_description }}

{% if cookiecutter.add_pyup_badge == 'y' %}[![PyUp](https://pyup.io/repos/gitlab/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}/shield.svg)](https://pyup.io/repos/gitlab/{{ cookiecutter.gitlab_username }}/{{ cookiecutter.project_slug }}/){% endif %}

{% if is_open_source %}* Free software: {{ cookiecutter.open_source_license }}
* Documentation: https://{{ cookiecutter.project_slug | replace("_", "-") }}.readthedocs.io.
{% endif %}

## Features

* TODO

## Credits
* {{ cookiecutter.full_name }} <{{ cookiecutter.email }}>
