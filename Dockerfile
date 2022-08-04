FROM centos as web

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*


RUN yum update -y
RUN yum install epel-release -y
RUN yum install nodejs -y
RUN yum install npm -y

RUN curl -O https://dl.eff.org/certbot-auto
RUN mv certbot-auto /usr/local/bin/certbot-auto
RUN chmod 0755 /usr/local/bin/certbot-auto

# Create a directory where our app will be placed
RUN mkdir -p /app

# Change directory so that our commands run inside this new directory
WORKDIR /app

# Get all the code needed to run the app
COPY . /app/
#CMD ["sudo","npm","install","-g","@angular/cli@9.1.13"]
RUN npm install -g @angular/cli@9.1.13
RUN npm install
RUN npm install onesignal-ngx


#RUN npm i @angular-devkit/build-angular@0.901.13
#RUN npm run build

# Expose the port the app runs in
EXPOSE 4200

# Serve the app
#CMD ["npm", "start"]
CMD ["ng", "serve","--host","0.0.0.0"]

#Stage 2
#FROM nginx:alpine
#COPY --from=web app/mysite.conf /etc/nginx/conf.d/default.conf
#COPY --from=web app/dist/ /srv/mysite/
#EXPOSE 80
