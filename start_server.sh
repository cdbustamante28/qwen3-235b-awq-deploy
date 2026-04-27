#!/usr/bin/env bash
set -euo pipefail

export HF_HOME="${HF_HOME:-/teamspace/studios/this_studio/.cache/huggingface}"
export VLLM_USE_V1=1
export VLLM_WORKER_MULTIPROC_METHOD=spawn

MODEL="${MODEL:-QuantTrio/Qwen3-235B-A22B-Instruct-2507-AWQ}"
SERVED_NAME="${SERVED_NAME:-qwen3-235b-awq}"
PORT="${PORT:-8000}"
TP="${TP:-4}"
MAX_LEN="${MAX_LEN:-32768}"
GPU_UTIL="${GPU_UTIL:-0.88}"

exec python3 -m vllm.entrypoints.openai.api_server \
  --host 0.0.0.0 \
  --port "${PORT}" \
  --model "${MODEL}" \
  --served-model-name "${SERVED_NAME}" \
  --tensor-parallel-size "${TP}" \
  --dtype auto \
  --quantization awq_marlin \
  --max-model-len "${MAX_LEN}" \
  --gpu-memory-utilization "${GPU_UTIL}" \
  --enforce-eager \
  --trust-remote-code \
  --no-enable-log-requests
