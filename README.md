<h1 align=center>Dockette / Nexus</h1>

<p align=center>
   <a href="https://github.com/dockette/nexus/actions"><img src="https://github.com/dockette/nexus/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/nexus"><img src="https://img.shields.io/docker/pulls/dockette/nexus.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
   🎁 Clean Sonatype Nexus Repository Manager 3 image
</p>

![](https://github.com/dockette/nexus/blob/master/.docs/nexus.png "Nexus")

-----

## Usage

```
docker run -it --rm -p 8081:8081 -v $(pwd)/data:/nexus-data dockette/nexus:3.82.1-java17-ubi
```

Published images are version-tagged. The workflow publishes `dockette/nexus:3.82.1-java17-ubi`, not `dockette/nexus:latest`; the Makefile uses `DOCKER_TAG=latest` only as a local build default.

Nexus can take several minutes to start. The test target waits up to `DOCKER_TEST_TIMEOUT=600` seconds before failing. When running the container via `make run`, read the initial admin password with:

```
make run-password
```

## Documentation

This is a Nexus 3 OSS build with the default repositories disabled, so Nexus starts completely clean.

Community plugins are not preinstalled. The Dockerfile keeps commented plugin download and copy steps as optional staging examples; enable them only after verifying compatibility with the selected Nexus version.

**Optional community repositories** (`3.78+`)

- No verified optional repository plugins are documented for this version yet.

**Optional community repositories** (`<3.71`)

- apk
- cargo
- composer
- cpan
- puppet

**Defaults**

Default repositories are disabled. Nexus is completely clean by default.

<p>
    <img width="350" src="https://github.com/dockette/nexus/blob/master/.docs/repos1.png">
    <img width="350" src="https://github.com/dockette/nexus/blob/master/.docs/repos2.png">
</p>

**Optional community blobstores**

- google

<p>
    <img width="700" src="https://github.com/dockette/nexus/blob/master/.docs/blobstores.png">
</p>

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider [supporting](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
