#***********************************************
# To run a docker instance 
# from the root of nodebb folder
# 1)  Build the docker file and name it (-tag)mynodebb. 
#       You can name it whatever you want it needs to be lowercase. 
#       Notice that there is a period at the end of the cmd -> that sets the location context to current directory
#       This could take a little time. 
#    cmd->  docker build --tag mynodebb .  
# 2) Run the image and map a external -p(port) 4567:4567 to your local port
#    cmd ->  docker build --rm -f Dockerfile -t nodebb:latest NodeBB
# 3) Go to localhost:4567 
#--------------------- 
# other helpfull commands 
# Get help on a specific command
#       cmd -> docker <command> --help
# remove all stopped containers and images 
#   > 1.13 
#       contianers/images cmd->  docker system prune -a  
#   < 1.13 
#       containers  cmd ->  docker rm $(docker ps -a -q)
#       images      cmd ->  docker rmi $(docker images)
#***********************************************

# The base image is the latest node on jessie (debian)
# -onbuild will install the node dependencies found in the project package.json
# and copy its content in /usr/src/app, its WORKDIR
#FROM node:8.7-onbuild
FROM node:6.11-onbuild

ENV NODE_ENV=production \
    daemon=false \
    silent=false



# nodebb setup will ask you for connection information to a redis (default), mongodb then run the forum
# nodebb upgrade is not included and might be desired
CMD node app --setup && npm start

# docker run -d -p 4567:4567 -v $(PWD):/usr/src/app -w /usr/src/app nodebb

# the default port for NodeBB is exposed outside the container

