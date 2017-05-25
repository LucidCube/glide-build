FROM gcr.io/cloud-builders/glide

RUN mkdir -p ~/.ssh
COPY known_hosts ~/.ssh/known_hosts

COPY ssh.sh /ssh.sh
ENV GIT_SSH=/ssh.sh

COPY lucid-glide.bash /builder/bin/
ENTRYPOINT ["lucid-glide.bash"]
