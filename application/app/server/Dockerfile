FROM python:3.8-slim-buster
RUN export FLASK_APP=portfolioserver
RUN export FLASK_ENV=development
WORKDIR /app
COPY . /app
RUN pip3 install -r requirements.txt
CMD ["python3", "portfolioapp.py"]