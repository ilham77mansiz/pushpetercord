# Panda - UserBot
FROM  ilhammansiz17/ilham-mansiez-petercord:Petercord-Userbot

RUN git clone -b main https://github.com/PandaUserbot/Dev /root/Panda
RUN mkdir /root/Panda/.bin
RUN pip install --upgrade pip setuptools
WORKDIR /root/Panda

#Install python requirements
RUN pip3 install -r https://raw.githubusercontent.com/PandaUserbot/Dev/main/requirements.txt

CMD ["bash", "DEPLOY.sh"]
