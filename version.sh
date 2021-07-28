curl \
  --user $GITHUB_TOKEN:x-oauth-basic \
  --silent "https://api.github.com/repos/aptible/supercronic/releases" | \
  docker run  --rm -i imega/jq -r ".[].tag_name" | \
  tail -n +1 | \
  head -1