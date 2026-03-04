My pandoc userdata directory.

They go in `%appdata%\pandoc\` on Windows and `~/.pandoc/` on Linux.

Requirements:

- Latex distribution. MikTex on Windows, TeXLive on Linux.
    - With Spanish support
- And some specific SVG Latex package that I forgot the name of, I will update this README when I remember.

How to generate something:

Given a `source.md` markdown file, execute:

for pdf 

```
pandoc source.md -o output.pdf -d base -d pdf
```

for html

```
pandoc source.md -o output.html -d base -d html --embed-resources
```
