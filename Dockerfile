FROM ubuntu:22.04

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y build-essential python3
RUN apt-get install -y python3-pip
# RUN pip3 install --upgrade pip

# add dbt profiles 
RUN mkdir /root/.dbt
COPY ./.dbt/profiles.yml /root/.dbt

# Set the working directory in the container
RUN mkdir /app
WORKDIR /app

# Copy the project and lock file here to cache dependencies in
COPY . /app/
RUN pip3 install -r requirements.txt --no-deps

# EXPOSE 8080
ENTRYPOINT ["dbt run"]