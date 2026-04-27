# Qwen3-235B-A22B-Instruct AWQ — vLLM OpenAI-compat (4×A100)

Lightning deployment image for **QuantTrio/Qwen3-235B-A22B-Instruct-2507-AWQ** served via vLLM on 4× A100 80GB.

## Endpoint

OpenAI-compat at `http://<host>:8000/v1/`. Smoke:

```
curl -s http://<host>:8000/v1/models
```

Served model name: `qwen3-235b-awq`.

## Hardware

4× A100 80GB SXM4 (TP=4, ~73 GB / GPU steady-state with 32K ctx KV cache).

## Tunable env

| var          | default                                          |
|--------------|--------------------------------------------------|
| `MODEL`      | `QuantTrio/Qwen3-235B-A22B-Instruct-2507-AWQ`    |
| `SERVED_NAME`| `qwen3-235b-awq`                                 |
| `PORT`       | `8000`                                           |
| `TP`         | `4`                                              |
| `MAX_LEN`    | `32768`                                          |
| `GPU_UTIL`   | `0.88`                                           |

## Build / run locally

```
docker build -t qwen3-235b-awq .
docker run --gpus all -p 8000:8000 qwen3-235b-awq
```

Cold-start ~5-10 min (HF download + weight load).
