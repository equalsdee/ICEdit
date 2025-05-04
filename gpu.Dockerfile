FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
RUN apt update && \
    apt install -y python3 python3-pip git && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt clean

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gradio

ENTRYPOINT []
CMD ["python3", "scripts/gradio_demo.py", "--enable-model-cpu-offload"]
