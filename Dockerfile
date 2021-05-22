# Use the Python3.7-alpine
FROM python:3.7-alpine

# Set the working directory to /app
WORKDIR /app
ADD requirements.txt /app

# Install the dependencies
RUN pip3 --default-timeout=200  install -r requirements.txt


# Copy the current directory contents into the container at /app 
ADD . /app


EXPOSE 5000
# run the command to start uWSGI

RUN chmod +x ./start.sh
CMD ["./start.sh"]


