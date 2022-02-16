# Panda - UserBot

FROM python:3.9

WORKDIR root/app/
ENV PYTHONUNBUFFERED=1
COPY . .
RUN bash INSTALL.sh
ENTRYPOINT ["bash", "DEPLOY.sh"]
