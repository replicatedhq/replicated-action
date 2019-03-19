#!/bin/bash

SET +e
RESULT=$(replicated release lint --yaml "$(< ${REPLICATED_YAML:-./replicated.yaml})")
SUCCESS=$?
echo "$RESULT"
set -e

COMMENT=""
if [ $SUCCESS -ne 0 ]; then
    OUTPUT=$RESULT
    COMMENT="#### \`replicated release lint\` Failed
$OUTPUT"
else
  COMMENT="#### \`replicated release lint output\`
$OUTPUT"
fi

PAYLOAD=$(echo '{}' | jq --arg body "$COMMENT" '.body = $body')
COMMENTS_URL=$(cat /github/workflow/event.json | jq -r .pull_request.comments_url)
curl -s -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --data "$PAYLOAD" "$COMMENTS_URL" > /dev/null

exit $SUCCESS
