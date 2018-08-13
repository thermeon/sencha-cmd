sencha-cmd docker
=================

Docker image to run Sencha Cmd with Sencha Compass

Build Production App
--------------------

To build a Sencha project using Sencha CMD:

    docker run --rm -v $(pwd)/project:/project --workdir /project thermeon/sencha-cmd app build
