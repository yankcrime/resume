FROM ubuntu:14.04

MAINTAINER Nick Jones nick@dischord.org

RUN apt-get update && apt-get install -y \
	pandoc texlive texlive-latex-extra \
	tex-gyre lmodern git make && \
	git clone https://github.com/yankcrime/resume.git /resume && \
	cd /resume && \
	git submodule sync ; git submodule update --init && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir /app

ADD ./docker/docker-entrypoint.sh /app/
RUN chmod +x /app/docker-entrypoint.sh
ENTRYPOINT ["/app/docker-entrypoint.sh"]
