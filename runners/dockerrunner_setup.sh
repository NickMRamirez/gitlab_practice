gitlab-runner unregister --name $RUNNER_NAME 2>/dev/null
gitlab-runner register --non-interactive
gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner