FROM python:3.9-slim

#Necessary C build dependencies
RUN apt-get update && apt-get install -y gcc python3-dev

WORKDIR /backend

RUN pip install --upgrade pip

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . . 

EXPOSE 4000

CMD ["python", "backend_app.py"]