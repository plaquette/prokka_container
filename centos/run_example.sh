docker run -it --rm -v $(pwd)/example_data:/data plaquette/prokka_helper:centos prokka --cpus 4 --prefix ERR016613 --outdir /data --force /data/ERR016613.scaffolds.fa


# docker run --rm -it plaquette/prokka_helper:centos /bin/sh