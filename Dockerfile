FROM python:3.13.2-slim
WORKDIR /app
RUN apt-get update && \
    apt-get install -y ffmpeg jq python3-dev && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python3 -m pip check yt-dlp
CMD ["python3", "bot.py"]
