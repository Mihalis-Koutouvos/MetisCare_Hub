FROM python:3.9-slim

WORKDIR /backend

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./backend /backend/

EXPOSE 4000

CMD ["python3", "app.py"]