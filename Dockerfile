FROM python:3.4

RUN mkdir -p /usr/src/app
ADD ./ /usr/src/app/
WORKDIR /usr/src/app

# Install requirements
RUN wget https://raw.githubusercontent.com/unlimitedlabs/orchestra/stable/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Create Django project
RUN django-admin startproject test_project

# Install Orchestra
RUN pip install orchestra

# Configure project
RUN wget https://raw.githubusercontent.com/unlimitedlabs/orchestra/stable/example_project/example_project/urls.py -O test_project/test_project/urls.py
ADD conf/settings.py test_project/test_project/settings.py
ADD conf/orchestra_settings.py test_project/test_project/orchestra_settings.py 

# Migration
RUN python test_project/manage.py migrate
RUN python test_project/manage.py loaddata demo_admin
RUN python test_project/manage.py loaddata demo_worker
RUN python test_project/manage.py loaddata journalism_workflow

EXPOSE 8000
CMD ["python", "test_project/manage.py", "runserver", "0.0.0.0:8000"]
