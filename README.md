# Setup Environment using Docker 

The following guide is for facilitating an environment using [Docker](https://www.docker.com/). 

## What do I gain by setting up a docker container? 

- A portable and isolated environment that you can update and destroy once you are done. 
- You can re-use it for any ML Applications that you might want to develop without the worry of the OS you are running on. 


### Ok, I'm sold, what should I do now? 

## Pre-Requirements

- Install Docker based on the OS you are using. 
 
    Reference: [Docker - Get Started](https://www.docker.com/get-started)

## Build your docker image

Once you have Docker installed, Follow the next steps to build custom container from the miniconda3 image. 

1. Create your image.

From within the folder of this repo, run the following command:

```
docker build -t clamytoe/datasci .
```

**NOTE**: You can name your image whatver you like.
For this example I've chosen *datasci* because I'm going to use it for general DataScience work.

2. Run your image.

Execute the following command from the root folder of where you want Jupyter notebook to start from.
If you are working on the ml-zoomcamp exercises, you couls start from the **mlbookcamp-code** directory from within its repo.

I'm going to start from my user's home directory so that I can navigate to any folder on my `C:\` drive.
I'm on a Windows system, so my command will be different.
If you're on a *Nix system, use `$PWD` instead of `%cd%`.

```
docker run -p 8888:8888 -p 6006:6006 -v %cd%:/notebooks --name datasci clamytoe/datasci
```

Once your container is running, open up a browser to [localhost:8888](http://localhost:8888)

> **NOTE**: Make sure you use the **Quit** button on the upper right of the notebook when you're done to stop the container.

3. How to restart your container.

The next time that you need to run your container, you can start it with its container name.
In our case, we named it **datasci** with this flag: `--name clamytoe/datasci`

```
docker start datasci
```

If you didn't name yours, you can find the random name that it was given with the following command:

```
>docker ps -a
CONTAINER ID   IMAGE                     COMMAND                  CREATED              STATUS
    PORTS     NAMES
89775a6b93fa   datasci                   "/root/run_jupyter.sh"   About a minute ago   Exited (0) About a minute ago             charming_jemison
```

As you can see, the name of my container is **charming_jemison** so I can restart my contrainer like a so:

```
docker start charming_jemison
```

> **NOTE**: You can also start the image by its container id.
Only the first several characters are needed:
```
docker start 8977
```

Opening a browser to `[localhost:8888](http://localhost:8888) will bring my to its running notebook.

If you are using **Docker Desktop**, you can also restart your container from there by clicking ont he little play button under *Actions* in the Containers section.
