FROM python:3.13-alpine3.20 AS base

WORKDIR /home/api

RUN adduser -D -h /home/api api && chown api:api -R /home/api

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

USER api

COPY uv.lock pyproject.toml ./
COPY app app

RUN uv sync --locked

EXPOSE 8000

FROM base AS dev
CMD ["uv", "run", "fastapi", "dev", "--app", "app", "--port", "8000", "--host", "0.0.0.0"]

FROM base AS prod
CMD ["uv", "run", "fastapi", "run", "--app", "app", "--port", "8000", "--host", "0.0.0.0", "--proxy-headers"]
