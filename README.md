# Maven Builder (Cross Compiler)
The builder uses a pre defined settings.xml file with the maven repo configuration.

## Usage

* Provide the source code in a volume named data. E.g. 
```
git clone https://code.linksmart.eu/la/data-processing-agent.git src
```

* Run the builder with the normal maven comands as arguments. E.g. using `install` phase skiping test
```
docker run --rm -v src:/data docker.linksmart.eu/ci/maven-builder install -Dskip
```

* In case of need to provide access to the LinkSmart maven repo, the password and optionally the username (in case is not pipelines server) must be provided. This can be done by setting the environmental variables SERVER_PASSWORD and/or SERVER_USERNAME using `-e` . E.g.:
```
docker run --rm -v src:/data -e SERVER_PASSWORD=thisIsNoPass -e SERVER_USERNAME=thisIsNoUser docker.linksmart.eu/ci/maven-builder deploy
```

* If new maven repos must be added, the settings.xml file located in `https://code.linksmart.eu/scm/ci/docker-builder.git` must be updated and the image rebuild.