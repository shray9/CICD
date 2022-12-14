FROM python:3.10.0

COPY requirements.txt .
COPY hello_world.py .
RUN mkdir /opt/hello_world/
RUN pip install --upgrade pip==22.2.0 \
    && pip install --no-cache-dir -r requirements.txt \
    && pyinstaller -F hello_world.py \
    && cp dist/hello_world /opt/hello_world/

EXPOSE 80
WORKDIR /opt/hello_world/

CMD [ "./hello_world" ]
