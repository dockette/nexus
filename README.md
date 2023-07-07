<h1 align=center>Dockette / Nexus</h1>

<p align=center>
   🎁 Sonatype Nexus Repository Manager 3 with preinstalled community plugins
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
  <a href="https://hub.docker.com/r/dockette/nexus/"><img src="https://badgen.net/docker/pulls/dockette/nexus"></a>
  <a href="https://bit.ly/ctteg"><img src="https://badgen.net/badge/support/gitter/cyan"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
</p>

![](https://github.com/dockette/nexus/blob/master/.docs/nexus.png "Nexus")

-----

## Usage

```
docker run -it --rm -p 8081:8081 -v $(pwd)/data:/nexus-data dockette/nexus:3.57.0
```

## Documentation

This is Nexus 3 OSS build with full-features community plugins.

**Community repositories**

- apk
- composer
- cpan
- puppet

**Defaults**

Default repositories are disabled. Nexus is completly clean by default.

<p>
    <img width="350" src="https://github.com/dockette/nexus/blob/master/.docs/repos1.png">
    <img width="350" src="https://github.com/dockette/nexus/blob/master/.docs/repos2.png">
</p>

**Community blobstores**

- azure
- google

<p>
    <img width="700" src="https://github.com/dockette/nexus/blob/master/.docs/blobstores.png">
</p>

## Development

See [how to contribute](https://contributte.org/contributing.html) to this package.

This package is currently maintaining by these authors.

<a href="https://github.com/f3l1x">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>

-----

Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Also thank you for using this package.
