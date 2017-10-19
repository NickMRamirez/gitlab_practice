# Practice using gitlab

1. Start the VM with `vagrant up`
2. SSH into the VM with `vagrant ssh`
3. Start gitlab with:

```
cd /vagrant
sudo docker-compose up -d
```

4. Start the gitlab runners:

```
cd /vagrant/runneres
sudo docker-compose up -d
```

5. There's a .NET Core project called *ectoplasm* that has a gitlab-ci.yml. Commit this to a new project in gitlab (after logging into gitlab at http://192.168.50.3)