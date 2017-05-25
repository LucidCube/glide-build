FROM gcr.io/cloud-builders/glide

RUN git config --global url."git@github.com:".insteadOf "https://github.com/"
RUN mkdir -p ~/.ssh
COPY known_hosts ~/.ssh/known_hosts

COPY ssh.sh /ssh.sh
ENV GIT_SSH=/ssh.sh
