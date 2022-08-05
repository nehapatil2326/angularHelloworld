FROM centos:centos7

RUN yum update -y
RUN yum install epel-release -y
RUN yum install nodejs -y
RUN yum install npm -y

# Create a directory where our app will be placed
RUN mkdir -p /app

# Change directory so that our commands run inside this new directory
WORKDIR /app

# Get all the code needed to run the app
COPY . /app/
RUN npm install -g @angular/cli@9.1.13
RUN npm install

# Expose the port the app runs in
EXPOSE 4200

# Serve the app
CMD ["ng", "serve","--host","0.0.0.0"]
