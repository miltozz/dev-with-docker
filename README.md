# A demo app to test Docker

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express
- mongodb for data storage
- mongoexpress for a db ui

# Build the docker image

`docker build -t myapp:v1.0 .`

# Start the app locally with Docker

### 1. Create docker network

`docker network create mongo-network`

### 2. Start mongodb 

`docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo` 

### 3. Start mongo-express
    
`docker run -d -p 8080:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express`

### 4. Open mongo-express from browser and create db and collection

- url: `http://localhost:8080`
- db: `my-db`
- collection: `users` 

### 5. Start nodejs app locally. 

- `cd app`
- `npm install `
- `node server.js`
    
### 6. Access app

`http://localhost:3000`

# Start the app with Docker Compose

## Notes:
- `docker-compose` reads env vars from `.env` file.
- The `.env` can be overidden by host env vars.
- fill required values on `.env` or add them with `export`
- If runnning on remote host (e.g. ec2 e.t.c):
    - add the host-ip in `app/public/javascripts/script.js` and rebuild/push image
    - open ports 3000 and 8080 on the host.
    - install docker on host
    - scp docker-compose.yaml on host
    - docker login if image is on private repos
    

### 1. start app, mongodb and mongo-express

`docker compose -f docker-compose.yaml up -d` OR
`docker compose up -d`
    
### 2. in mongo-express UI in url:8080
- create a new database "my-db"
- create a new collection "users" in the database "my-db"       
    
### 3. check app in url:3000

---
Based on: [techworld-js-docker-demo-app](https://gitlab.com/nanuchi/techworld-js-docker-demo-app)

