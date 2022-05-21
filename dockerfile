FROM jupyterhub/jupyterhub:latest
WORKDIR /srv/jupyterhub
RUN apt update && apt upgrade -y
RUN apt install python3 python3-pip npm nodejs libnode64 nano -y
RUN npm install -g configurable-http-proxy
RUN pip install jupyter jupyterhub-nativeauthenticator 
COPY jupyterhub_config.py jupyterhub_config.py
COPY bootstrap.sh bootstrap.sh
COPY momonga.py /home/momonga.py
CMD ["jupyterhub","jupyterhub_config.py"]
