FROM python:3.9

RUN git clone https://github.com/ilhammansiz/PandaX_Userbot /root/app
WORKDIR root/app/
ENV PYTHONUNBUFFERED=1
COPY . .
RUN bash start.sh
ENTRYPOINT ["python3", "-m", "Panda"]
