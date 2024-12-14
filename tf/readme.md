## 도커 이미지 레포 구축하기 ##

* [Nexus3 Repository 구축 - Docker Image Repo](https://velog.io/@cptbluebear/Nexus3-Repository-%EA%B5%AC%EC%B6%95)
* [Harbor 설치 및 방법](https://velog.io/@hyeseong-dev/Harbor-%EC%86%8C%EA%B0%9C-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EB%B0%B0%ED%8F%AC)


## CD ##

* [spinnaker 란?](https://berrrrr.github.io/programming/2020/01/12/what-is-spinnaker/)
  * [Managing Spinnaker using Spinnaker Operator in Amazon EKS](https://aws.amazon.com/blogs/opensource/managing-spinnaker-using-spinnaker-operator-in-amazon-eks/)
 
* [CI/CD #12. Jenkins(젠킨스)를 이용한 Kubernetes(쿠버네티스) 배포](https://zunoxi.tistory.com/109)


## JDK ##

Command 'java' not found, but can be installed with:
- sudo apt install default-jre              # version 2:1.11-72build2, or
- sudo apt install openjdk-11-jdk-headless  # version 11.0.24+8-1ubuntu3~22.04
- sudo apt install openjdk-17-jdk-headless  # version 17.0.12+7-1ubuntu2~22.04
- sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
- sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
- sudo apt install openjdk-21-jdk-headless  # version 21.0.4+7-1ubuntu2~22.04
- sudo apt install openjdk-8-jdk-headless   # version 8u422-b05-1~22.04


## Docker Buildx /w Multi Arch ##
* https://andrewlock.net/combining-multiple-docker-images-into-a-multi-arch-image/


## Metric Gathering /w Prometheus ##
* [How to use helm](https://helm.sh/ko/docs/intro/using_helm/)
* [Prometheus scrape with POD](https://medium.com/@hayounglim/prometheus-helm-how-to-scrape-metrics-from-multiple-pods-using-spring-actuator-08fccd0cf69e)
![](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/images/prometheus-scrape-1.png)
* [Add Additonal Scrape Config with Helm](https://stackoverflow.com/questions/57925786/add-scrape-configs-to-prometheus-using-helm)
![](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/images/prometheus-scrape-2.png)
* render prometheus configuration.
```
helm template prometheus prometheus-community/prometheus -f values.yaml
```

## Prometheus ##

* [How relabeling in Prometheus works](https://grafana.com/blog/2022/03/21/how-relabeling-in-prometheus-works/#internal-labels)

## K8S ##
* https://ssunw.tistory.com/entry/kubernetes-PV-PVC
