# Sample Custom Environment

This is a sample project that can be supplied to HackerRank as custom environment that can be brought up for candidates taking the test.

The project is to be structured as a typical Dockerized project repository with the only mandatory file being the `Dockerfile` itself. There are a few caveats which need to be kept in mind though and they are as described below.

## Dockerfile Specifications

- The `FROM` instruction has to mandatorily be set to `gcr.io/che-fullstack/rba-base:latest`
- The `USER` is set to `user`. Append `sudo` to `RUN` instructions to perform privileged actions.
- Additional users can also be added if necessary but ensure the default user is set to `user` if overridden by previous instructions.
- Additional files can be placed in the project root to `COPY` or `ADD` to the image through the Dockerfile.
- DO NOT override the `ENTRYPOINT` or `CMD` instructions. Commands to be executed can be done so using the `Run`, `Install` or `Test` commands that are allowed to be configured during Question creation in HackerRank.
- The `WORKDIR` is set to `/projects`. Ensure it is reset to the same value if overridden by previous instructions.

### Base Image

The image `gcr.io/che-fullstack/rba-base:latest` consists of

- Ubuntu:16.04
- Essential system packages (sudo, bash, wget, unzip, curl, software-properties-common, zip, rar, unrar, vim , git, iputils-ping, net-tools etc.)
- Node v8.15.1 LTS and npm v6.4.1
- Java-1.8.0-openjdk-amd64

While preparing the Dockerfile and any additional files, ensure there are no conflicts arising because of the above.

## Limits

- Maximum Image Size: 1GB
