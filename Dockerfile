FROM gcr.io/cloud-builders/glide

RUN git config --global url."git@github.com:".insteadOf "https://github.com/"
RUN mkdir -p ~/.ssh && \
	echo 'Host github.com\n\tUser git\n\tIdentityFile /workspace/github-key\n\tStrictHostKeyChecking no\n' >~/.ssh/config

COPY lucid-glide.bash /builder/bin/
ENTRYPOINT ["lucid-glide.bash"]
