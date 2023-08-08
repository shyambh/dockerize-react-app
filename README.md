# Dockerize React App

### Introduction

This is a sample React App which is a clone of a medium-like blogging application. The application is called Conduit. The app is hosted at [https://next-realworld.vercel.app/](https://next-realworld.vercel.app/) and the source code is available at https://github.com/reck1ess/next-realworld-example-app

I have used the source code from this repo and have added some tests to perform some sanity checks. I have used Cypress as the E2E testing tool, and have used Postman to test the APIs.

The folder `Conduit_NodeJS` contains the code that spins up the Node server, and `next-realworld-example-app` contains the frontend code. Both the services can be independently be spun up as they each have their respective Dockerfiles within the folder.

If you would like to set up a Docker container to take care of all the set ups, then you can do so by using the `docker-compose.yml` file in the root of the project.

I have used `dump.sql` to to seed the database before the testing begins.

**Frontend** : [http://localhost:3000](http://localhost:3000/)
**Backend API** : [http://localhost:8080/api](http://localhost:8080/api)

### **Commands:**

***To Run the Postman API Tests:***
`npx newman run Conduit.postman_collection.json --delay-request 500 --global-var "APIURL=http://localhost:8080/api" --global-var 	"USERNAME=shyambh" --global-var "[EMAIL=bhattaraishyam@gmail.com](mailto:EMAIL=bhattaraishyam@gmail.com)" --global-var "PASSWORD=Test123$"`

***To run the Cypress tests:***
`npx cypress run --spec .\FunctionalTests\login.spec.js`

***Docker*** :
Build Image :
`docker build -t conduit-image .`

```
Start Container from Image:
	docker run -dp 3001:3000 conduit-image

Npm Install for conflicting React versions:
	npm install --save --legacy-peer-deps

```

### GitHub Actions

The project has been set up with GitHub Actions to monitor every code check-ins and keep an eye for any breaking code changes.
