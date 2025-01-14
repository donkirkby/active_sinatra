# Prebuilding dev container images

This folder contains the instructions for prebuilding the dev
container image. To rebuild an image, install the [dev container CLI], then
build.

    nvm use 16
    npm install --location=global @devcontainers/cli
    cd /path/to/active_sinatra/.devcontainer/prebuild
    devcontainer build --workspace-folder . --push false --image-name donkirkby/active-sinatra-devcontainer:vX.Y

If you want to share your changes, create an account on docker hub, run
`docker login`, then replace `donkirkby` with your account and change to
`--push true`.

[dev container CLI]: https://code.visualstudio.com/docs/devcontainers/devcontainer-cli
