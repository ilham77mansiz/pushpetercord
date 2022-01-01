# Panda - UserBot
# # Copyright (C) 2020-2021 by DevsExpo@Github, < https://github.com/DevsExpo >.
# recode by ilham mansiz
# This file is a part of < https://github.com/ilhammansiz/PandaX_Userbot/ >

FROM python:3.9

RUN git clone https://github.com/ilhammansiz/PandaX_Userbot /root/app
WORKDIR root/app/
ENV PYTHONUNBUFFERED=1
COPY . .
RUN bash INSTALL.sh
