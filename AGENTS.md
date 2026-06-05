# AGENTS.md

## Project

Dockette image for Sonatype Nexus Repository Manager 3 OSS with a clean default repository setup and optional community plugin staging in the Dockerfile.

## Image

- Docker image: `dockette/nexus`.
- Default Nexus version: `3.82.1-java17-ubi` via `NEXUS_VERSION`.
- Build context is the repository root and `Dockerfile` is the only image definition.
- The image extends `sonatype/nexus3:${NEXUS_VERSION}`, installs `util-linux`, copies `entrypoint.sh`, and runs it as `CMD`.
- GitHub Actions builds for `linux/amd64` and publishes tag `${NEXUS_VERSION}`, not `latest`.

## Commands

- `make build` runs `docker buildx build` for `${DOCKER_PLATFORM}` with `NEXUS_VERSION` as a build arg.
- `make test` starts `nexus-test`, polls `http://127.0.0.1:8081/`, prints logs on timeout, and removes the container.
- `make run` starts the image on port `8081` as container `nexus`.
- `make run-password` reads `/nexus-data/admin.password` from the running `nexus` container.
- Override `DOCKER_TAG`, `DOCKER_PLATFORM`, `NEXUS_VERSION`, or `DOCKER_TEST_TIMEOUT` for local validation.

## Testing

- Use `make -n build test run` to dry-run the default commands before changing build logic.
- A real `make test` needs Docker, port `8081`, curl, and enough startup time for Nexus.
- Keep the README usage tag, Makefile `NEXUS_VERSION`, Dockerfile default arg, and workflow `NEXUS_VERSION` synchronized.

## Guidelines

- Keep `Dockerfile`, `entrypoint.sh`, `Makefile`, README usage, and `.github/workflows/docker.yml` aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Do not enable commented community plugin downloads without verifying compatibility with the selected Nexus version.
- Do not introduce unrelated formatting or structural changes.
