FROM python:3.9
RUN mkdir /usr/src/app/
COPY . /usr/src/app/
WORKDIR /usr/src/app/
EXPOSE 5555
#RUN apt update && apt install -y python3 python3-pip
RUN pip install -r requirements.txt
CMD ["python", "app.py"]