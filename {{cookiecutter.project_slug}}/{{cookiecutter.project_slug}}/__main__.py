import traceback
from {{cookiecutter.project_slug}}.{{cookiecutter.project_slug}} import main

if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        print(traceback.format_exc())
