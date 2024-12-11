# If you wanted to create a docker image of your frontend micro service we need to pull the frontend from the GIT repository. Once we have done the pull move to frontend directory. then we can issue a docker command  docker build .  --> this will build the nginx image with our fronend contents from the folder.

# sudo usermod -a -G docker centos