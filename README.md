# Crypto Service

Simple Express service (Node.js encrypt/decrypt) demonstrating build, deployment and hosting of a simple *standalone* service in Kubernetes Engine (GCloud)

Important 1) Steps here are a prerequisite:

[Registration Service Mesh Setup](https://github.com/burningglass/registrationservicemeshsetup)

Important 2) Familiarity with this project will ease tackling the more advanced service projects:

[Registration Store](https://github.com/burningglass/registrationstore)<br/>
[Registration Web(GUI)](https://github.com/burningglass/registrationgui)

## 2 Repo set-up

### 2.1 Create an empty Repo (in GitHub)

Your repo can be Public or Private:

![Repo set-up](README.images/Picture1.png)

### 2.2 Copy Repo location to clipboard

![Copy repo location](README.images/Picture2.png)

### 2.3 Create the parent working folder

On the local Desktop (using the Command Prompt):

`cd %HOMEPATH%`</br>
`mkdir projects`</br>
`cd projects`

### 2.4 Clone the repo

`git clone <paste>` (i.e. URL copied into Clipboard from GitHub above)

## 3 Write the code

### 3.1 IDE launch

`cd %HOMEPATH%\projects\cryptoservice`<br/>
`code .` (to launch VS Code in the context of this project folder)

### 3.2 Create Package.json

Using your preferred Terminal create this file:

`npm init`

Edit package.json to add the 'express' dependency:

![Express dependency](README.images/Picture3.png)

Back in Terminal, install the package dependencies (i.e. initially installs just 'express' and its dependencies):

`npm config set registry https://registry.npmjs.org`</br>
`npm install`

### 3.3 Create the main script

Now code the main script (index.js):

![Express dependency](README.images/Picture4.png)

### 3.4 Run the service

The following commands start this Node.js app (which is Javascript, therefore interpreted code when its end-points are invoked - on port 4000 in this case):

*In Windows*<br/>
`set PORT=4000`<br/>
`npm start`

*In MacOS*<br/>
`PORT=4000 npm start`

Now open a separate Terminal to check the service is listening on its http end-points:

`netstat -a`<br/>
or<br/>
`netstat -a | find 4000`

![Express dependency](README.images/Picture5.png)

### 3.5 Test the service

CURL to encrypt data (a string in plain text):

![CRL service endpoint to encrypt](README.images/Picture6.png)

CURL to decrypt (using encrypted string from above):

![CRL service endpoint to decrypt](README.images/Picture7.png)

## 4 Update the repo

### 4.1 Set contributing-user properties (if necessary)

Under `%HOMEPATH%\projects\cryptoservice`:<br/>
`git config --global user.name "<ContributorName>"`<br/>
`git config --global user.email "<ContributorEmailAddress>"`

### 4.2 Push code and config back to GitHub

Under `%HOMEPATH%\projects\cryptoservice`:<br/>
`git add app/index.js`<br/>
`git add package.json`<br/>
`git add package-lock.json`<br/>
`git commit -m "Initial bulk (Crypto service) code upload"`<br/>
`git push`<br/>

## 5 Dockerize the app (in GCloud)

### 5.1 Connect to GKE context in GCloud:

![Connecting to GKE context](https://github.com/burningglass/registrationservicemeshsetup/blob/main/README.images/Picture1.png)

### 5.2 Connect to the K8s cluster:

![Connecting to K8s cluster](https://github.com/burningglass/registrationservicemeshsetup/blob/main/README.images/Picture2.png)

![Connecting to K8s cluster](https://github.com/burningglass/registrationservicemeshsetup/blob/main/README.images/Picture3.png)

### 5.3 Create the parent working folder (GCloud Shell environment):

`cd ~`<br/>
`mkdir projects`<br/>
`cd projects`

### 5.4 Clone the Repo (from GitHub):

`git clone <paste>` (i.e. URL copied to clipboard in 2.2)

### 5.5 Switch to project folder:

`cd cryptoservice`

### 5.6 Enable Docker in GCloud:

`gcloud auth configure-docker`

### 5.7 Create and build the Dockerfile

If necessary, based on: 

[Dockerfile](https://github.com/burningglass/cryptoservice/blob/main/Dockerfile)<br/>

The Docker build:

`gcloud projects list` yields PROJECT_ID<br/>

`docker build -t gcr.io/[PROJECT_ID]/cryptoservice:v1.0.0 .` builds the container image:

![Docker build](README.images/Picture7.png)

### 5.8 Check the local (Docker) Registry

`docker image ls` reveals the newly-built image (above) showing its <image id>

### 5.9 Start and verify service in GCloud Shell

The following command creates container <container name> "cryptoservicecontainer" and starts it:

`docker run -d -i -t -p:5000:8080 --name cryptoservicecontainer <image id>`<br/>

- It will be inwardly listening on 8080
- It will be outwardly listening on 5000

Check the container is running:

`docker container ls`<br/>

Note. how this container (i.e. instance of the image) is:

1. Running in the background
2. Shows the host and ports it is listening on
3. Identified by the container name given

It is also possible to check the app service's listening port using netstat:

`netstat -a | grep 5000` should yield one line showing it is outwardly listening

### 5.10 Terminal into container

The following works...<br/>

`docker exec -it <container name> /bin/bash`<br/>

...because the docker container was started with the -i switch<br/>

Note. `-it` (docker run switch) allocates a pseudo-TTY connected to the container’s stdin<br/>

pseudo-TTY: A device that has the functions of a physical terminal without actually being one. Created by terminal emulators such as xterm<br/>

While inside this container's filesystem:<br/>

`ls` will reveal (alongside the folders of the base image reference by the Dockerfile) the (app)service folder copied into the image: `/app`<br/>

`exit` exits out of this container

### 5.11 Test app service

The following command...<br/>

`curl -G -i "http://localhost:5000/encrypt" -d "secret=5050" -d "message=hellothereworld"`<br/>

...reveals this containerized version of the service works in the local GShell environment

![Service working in GShell](README.images/Picture9.png)

### 5.12 Clean up

Not strictly necessary because GCloud Shell will clean up the workspace, but for learning purposes:<br/>

`docker container stop <container name>`<br/>

Now check the container has 'Exited':<br/>

`docker container ls -a`

And delete the container:<br/>

`docker container rm <container name>`<br/>

Note. Deleting the image is also possible (as follows), but **don't** because it will be installed into GCloud K8s (covered in the next section)<br/>

`docker image ls`<br/>
`docker image rm <image id>`




Ordered List:

1. First item
2. Second item
3. Third item

Unordered List:

- First item
- Second item
- Third item

`code`

Fenced Code Block:

```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

Horizontal Rule:

---

Table:

| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |

Link:

[title](https://www.example.com)

Image:

![alt text](image.jpg)
