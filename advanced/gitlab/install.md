## 설치 ## 
```
sudo apt-get update
sudo apt install -y ca-certificates curl openssh-server tzdata

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

sudo apt install gitlab-ce
sudo vi /etc/gitlab/gitlab.rb
    external_url 'http://ec2-addr:8081'

sudo gitlab-ctl reconfigure
sudo gitlab-ctl status

sudo cat /etc/gitlab/initial_root_password
```






## 참고자료 ##

* https://zoetechlog.tistory.com/160
