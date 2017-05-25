FROM gcr.io/cloud-builders/glide

COPY ssh.sh /ssh.sh
ENV GIT_SSH=/ssh.sh

COPY lucid-glide.bash /builder/bin/
ENTRYPOINT ["lucid-glide.bash"]
