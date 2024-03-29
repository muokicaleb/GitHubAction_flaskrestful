# Use the Python3.7.8-stretch
FROM python:3.7.8-stretch

# Set the working directory to /app
WORKDIR /app
ADD requirements.txt /app

# Install the dependencies
RUN pip3 --default-timeout=200  install -r requirements.txt


# Copy the current directory contents into the container at /app 
ADD . /app


EXPOSE 5000


RUN python3 -u -m unittest tests.py

# run the command to start uWSGI
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]


