sencha-cmd docker
=================

Docker image to run Sencha Cmd 6.1.1.76 with Sencha Compass

Build Production App
--------------------

To build a Sencha project using Sencha CMD:
    docker run --rm -v $(pwd)/project:/project --workdir /project thermeon/sencha-cmd app build
