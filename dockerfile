FROM jupyterhub/jupyterhub:latest
RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip npm nodejs libnode64 nano
RUN apt install -y --no-install-recommends docker.io
RUN npm install -g configurable-http-proxy
RUN pip install jupyter jupyterhub-nativeauthenticator
RUN pip install numpy pandas matplotlib sklearn japanize-matplotlib
WORKDIR /srv/jupyterhub 
COPY jupyterhub_config.py jupyterhub_config.py
COPY bootstrap.sh bootstrap.sh
COPY momonga.py /opt/lib/momonga.py
ENV PYTHONPATH="/opt/lib"
CMD ["jupyterhub","jupyterhub_config.py"]
