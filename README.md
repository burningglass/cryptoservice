# Crypto Service

Simple Express service (Node.js encrypt/decrypt) demonstrating build, deployment and hosting of a simple *standalone* service in Kubernetes Engine (GCloud)

Important 1) Step here are a perequisite:

[Registration Service Mesh Setup](https://github.com/burningglass/registrationservicemeshsetup)

Important 2) Familiarity with this project will ease tackling the more advanced service projects...

[Registration Store](https://github.com/burningglass/registrationstore)
[Registration Web(GUI)](https://github.com/burningglass/registrationgui)

## 2 Repo set-up

### 2.1 Create an empty Repo (in GitHub)

Your repo can be Public or Private:

![Repo set-up](README.images/Picture1.png)

### 2.2 Copy Repo location to clipboard

Your repo can be Public or Private:

![Copy repo location](README.images/Picture2.png)

### 2.3 Create the parent working folder

On the local Desktop (using the Command Prompt)

`cd %HOMEPATH%`</br>
`mkdir projects`</br>
`cd projects`

### 2.4 Clone the repo

`git clone <paste>` (i.e. that copied into Clipboard from GitHub above)

## 3 Write the code

### 3.1 IDE launch

`cd %HOMEPATH%\projects\cryptoservice`<br/>
`code .` (to launch VS Code managing this project folder)

### 3.2 Create Package.json

Using your preferred Terminal create this file:

`npm init`

Now edit package.json to add the 'express' dependency:

![Express dependency](README.images/Picture3.png)

Back in Terminal, now install the package dependencies (initially this just installs 'express'):

`npm config set registry https://registry.npmjs.org`</br>
`npm install`

### 3.3 Create main script

Now write the main code class (index.js):

![Express dependency](README.images/Picture4.png)

### 3.4 Run the service

The following commands start this Node.js app (which is Javascript, therefore interpreted code when its end-points are invoked on port 4000 in this case):

*In Windows*
`set PORT=4000`<br/>
`npm start`

*In MacOS*
`PORT=4000 npm start`

Now open a separate command prompt/terminal window to check the service is listening on its http end-points:

`netstat -a`<br/>
or 
`netstat -a | find 4000`

![Express dependency](README.images/Picture5.png)

### 3.5 Test the service

CURL to encrypt data (a string in plain text):

![CRL service endpoint to encrypt](README.images/Picture6.png)

CURL to decrypt (the encrypted string returned by the above):

![CRL service endpoint to decrypt](README.images/Picture7.png)

## 4 Update the repo

### 4.1 Ensure contributing-user properties are set

Under `%HOMEPATH%\projects\cryptoservice`:<br/>
`git config --global user.name "<ContributorName>"`<br/>
`git config --global user.email "<ContributorEmailAddress>"`

### 4.2 Push source and config back to GitHub

Under `%HOMEPATH%\projects\cryptoservice`:<br/>
`git add app/index.js`<br/>
`git add package.json`<br/>
`git add package-lock.json`<br/>
`git commit -m "Initial bulk (Crypto service) code upload"`<br/>
`git push`<br/>





⌘+`(backtick)
**bold text**
*italicized text*
> blockquote

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
