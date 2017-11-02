# Practice using gitlab

1. Start the VM with `vagrant up`
2. SSH into the VM with `vagrant ssh`
3. Start gitlab with:

```
cd /vagrant/gitlab
sudo docker-compose up -d
```

4. On the host, go to http://192.168.50.3 and wait for Gitlab to load. Set a new password, then log in with username *root*.

5. There's a .NET Core project called *ectoplasm* that has a gitlab-ci.yml. Commit this to a new project in Gitlab (after logging into gitlab at http://192.168.50.3). It will automatically build and create a new Docker image using the gitlab-ci.yml.

> NOTE: The Docker containers will need to be restarted with docker-compose if you restart the VM.