FROM ubuntu:22.04
RUN apt update -y && apt upgrade -y
RUN apt-get install wget apt-transport-https gnupg lsb-release -y
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add -
RUN echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list.d/trivy.list
RUN apt-get update -y && apt install python3 -y 
#RUN apt install python-pip -y 
#RUN pip install json2html
RUN apt-get install trivy -y
RUN mkdir -p /var/www
WORKDIR /var/www
COPY html.tpl /var/www/html.tpl
RUN echo "<h1>Trivy is working</h1>" > index.html
CMD ["python3", "-m", "http.server"]
