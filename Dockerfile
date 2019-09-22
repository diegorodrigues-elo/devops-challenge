FROM python:3.6

COPY app/ .
#WORKDIR /
RUN pwd
RUN ls
RUN pip install -r requirements.txt

EXPOSE 80
CMD ["python", "application.py"]
