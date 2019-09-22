FROM python:3.6

COPY app/ /app/
WORKDIR /app
RUN pwd
RUN ls -la
RUN pip install -r requirements.txt

EXPOSE 80
CMD ["python", "application.py"]
