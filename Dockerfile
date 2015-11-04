FROM python:3.4

RUN mkdir -p /usr/src/app
ADD ./ /usr/src/app/
WORKDIR /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install orchestra

EXPOSE 8000
CMD ["python", "example_project/manage.py", "runserver", "0.0.0.0:8000"]
