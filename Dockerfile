FROM vllm/vllm-openai:latest

WORKDIR /app

COPY start_server.sh /app/start_server.sh
RUN chmod +x /app/start_server.sh

ENV PORT=8000
EXPOSE 8000

ENTRYPOINT ["/app/start_server.sh"]
