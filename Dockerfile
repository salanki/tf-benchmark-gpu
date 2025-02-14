FROM nvcr.io/nvidia/tensorflow:20.12-tf2-py3

RUN mkdir -p /src
WORKDIR /src

RUN git clone https://github.com/tensorflow/benchmarks.git

ENV TF_FORCE_GPU_ALLOW_GROWTH true
ENV TF_CPP_MIN_LOG_LEVEL 2
ENV PYTHONUNBUFFERED 1
ENV MKL_DEBUG_CPU_TYPE 5

WORKDIR /src/benchmarks/scripts/tf_cnn_benchmarks

COPY ./benchmark.sh benchmark.sh

ENTRYPOINT ["./benchmark.sh"]
