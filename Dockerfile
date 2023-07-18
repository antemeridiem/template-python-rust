FROM python:3.11

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && apt-get install -y cmake libclang-dev libc++-dev gcc-multilib \
    && apt-get install -y postgresql

RUN pip install --upgrade pip wheel
RUN pip install \
    orjson pandas pyarrow requests retry \
    jupyter notebook \
    'black[jupyter]'

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup component add rust-src

CMD ["/bin/bash"]