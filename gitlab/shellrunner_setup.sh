# Wait for Gitlab server to become available...
/wait-for-it.sh $CI_SERVER_URL --timeout=600

chmod o+w /var/run/docker.sock
gitlab-runner unregister --name $RUNNER_NAME 2>/dev/null
gitlab-runner register --non-interactive
gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner