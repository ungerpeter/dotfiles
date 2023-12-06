ARG PLATFORM=linux/amd64
ARG VARIANT=bullseye

FROM --platform=$PLATFORM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}
ENV DOCKER_BUILDKIT=1

# Set the timezone to avoid interaction when installing packages
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Interactive sourced bash shell
SHELL ["/bin/bash", "-lc"]

# Install necessary system packages va apt
RUN apt update && apt install -y --no-install-recommends \
    curl \
    git \
    gnupg \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    build-essential \
    gettext-base \
    net-tools \
    dnsutils \
    iputils-ping \
    expect \
    python3 \
    jq \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoremove -y && apt clean -y 

# Install asdf package manager
ENV ASDF_DIR $HOME/.asdf
ENV ASDF_VERSION v0.12.0
RUN git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch $ASDF_VERSION
RUN echo ". '$ASDF_DIR/asdf.sh'" >> $HOME/.bashrc
RUN echo ". '$ASDF_DIR/completions/asdf.bash'" >> $HOME/.bashrc

# Install toolset via asdf package manager

## Python
# ENV PYTHON_VERSION 3.11.4
# RUN asdf plugin add python
# RUN asdf install python $PYTHON_VERSION
# RUN asdf global python $PYTHON_VERSION

## Chezmoi
ENV CHEZMOI_VERSION latest
RUN asdf plugin add chezmoi
RUN asdf install chezmoi $CHEZMOI_VERSION
RUN asdf global chezmoi $CHEZMOI_VERSION

## charm_ GUM
ENV GUM_VERSION latest
RUN asdf plugin add gum https://github.com/lwiechec/asdf-gum.git
RUN asdf install gum $GUM_VERSION
RUN asdf global gum $GUM_VERSION

## Gopass
ENV GOPASS_VERSION latest
RUN asdf plugin add gopass
RUN asdf install gopass $GOPASS_VERSION
RUN asdf global gopass $GOPASS_VERSION

# Install volta package manager for nodejs
ENV VOLTA_FEATURE_PNPM=1
ENV VOLTA_HOME $HOME/.volta
ENV PATH "$VOLTA_HOME/bin:$PATH"
RUN curl https://get.volta.sh | bash

# Install nodejs and yarn
# RUN volta install node@18.17.0
# RUN volta install yarn@3.6.1

# Install nodejs toolchain
# RUN volta list --format plain | awk '{print $2}' | xargs -I {} bash -c 'echo "Volta install {}" && volta install {}'

# Switch back to dialog for any ad-hoc use of apt
ENV DEBIAN_FRONTEND=dialog

# Setting the ENTRYPOINT to docker-init.sh will configure non-root access to 
# the Docker socket if "overrideCommand": false is set in devcontainer.json. 
# The script will also execute CMD if you need to alter startup behaviors.
ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]