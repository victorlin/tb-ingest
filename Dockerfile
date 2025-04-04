FROM mambaorg/micromamba:2.0.8

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes

COPY process-sequence /sbin/

WORKDIR /workdir
COPY defaults/ defaults/
