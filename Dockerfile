FROM python:3.11.4-alpine3.18

WORKDIR /school_system

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]