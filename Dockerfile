FROM python:3.7-alpine

RUN apk --update add bash vim gcc g++ 

VOLUME /envi

WORKDIR /envi

COPY envi/requirements.txt /envi/

EXPOSE 8000





RUN pip3 install --upgrade pip -r requirements.txt
EXPOSE 8000
