FROM redmine:7.0.2

WORKDIR /usr/src/redmine

RUN set -eux; \
    puma="$(grep -E "^[[:space:]]*gem [:'\"]puma['\",[:space:]].*$" Gemfile)"; \
    { echo; echo "$puma"; } | sed -re 's/^[[:space:]]+//' >> Gemfile; \
    bundle install --jobs "$(nproc)"
