GCLOUD_PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
GCLOUP_COMP=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc


if [[ -f $GCLOUD_PATH ]]; then
  . $GCLOUD_PATH
fi

if [[ -f $GCLOUD_COMP ]]; then
  . $GCLOUD_COMP
fi
