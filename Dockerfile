FROM ubuntu:22.04

RUN apt-get update 
# RUN apt-get upgrade -y
RUN apt-get install -y build-essential python3 \
    && apt-get install -y python3-pip \
    && apt-get install -y git vim
# RUN pip3 install --upgrade pip

# add dbt profiles 
RUN mkdir /root/.dbt

# COPY ./.dbt/profiles.yml /root/.dbt

# Set the working directory in the container
RUN mkdir /app
RUN mkdir /app/.secrets
WORKDIR /app

# Copy the project and lock file here to cache dependencies in
COPY . /app/
RUN pip3 install -r requirements.txt --no-deps
# set the dbt profiles path
ENV DBT_PROFILES_DIR="/app/.dbt"

# if you want to add to PATH environment variable


# EXPOSE 8080
ENTRYPOINT ["dbt"]