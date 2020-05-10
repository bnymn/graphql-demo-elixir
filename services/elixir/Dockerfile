FROM elixir:1.10.3-slim

ARG USER_ID
ARG GROUP_ID

# Create a new user and group in order to prevent creating files with root
RUN addgroup --gid ${GROUP_ID} user
RUN adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} user

USER user
WORKDIR /app
