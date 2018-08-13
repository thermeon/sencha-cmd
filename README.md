sencha-cmd docker
=================

Docker image to run Sencha Cmd with Sencha Compass

Build Production App
--------------------

To build a Sencha project using Sencha CMD:

    docker run --rm -v $(pwd)/project:/project --workdir /project eu.gcr.io/thermeon-container-registry/sencha-cmd app build
