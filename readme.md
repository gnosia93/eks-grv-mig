## 시나리오 ##

1. [EKS 클러스터 생성하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/1.infra.md)

2. [Multi 아키텍처 이미지 빌드하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-image.md)
    

3. graviton 노드 그룹 추가하기

5. 수동으로 배포하기
    - 파드 하나만 arm 노드에 배치해 보기 (서비스 pod selector 이용)
    - 카나리 배포 / 롤백하기 ; node affinity 를 이용한다. 결국 모두다 arm 노드로 배치될 예정이므로, ...      
    - 블루/그린 배포 / 롤백하기 ; node selector 를 이용한다..
7. [CI 파이프 라인과 연결하기 (젠킨스)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/7.jenkins.md)
8. CD 파이프 라인 구축하기 (Spinnaker)

10. 성능 측정하기
11. 로그 관찰하기  


## ... ##

app to graviton / db to graviton

* taint for graviton node
* scheduing graviton pod with deployment canary.
* daemonset migration
* multi architecture image build.
* EC2 Image Build.
* Java
* Web performance



## Performance ##

* [Improving Java performance on Neoverse N1 systems](https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/java-performance-on-neoverse-n1)




## 참고자료 ##

* https://github.com/aws-samples/graviton-workshop/tree/main/graviton/cs_graviton/app
* https://catalog.workshops.aws/graviton/en-US/amazoncontainers
* https://github.com/aws/aws-graviton-getting-started/blob/main/java.md
* https://gruuuuu.github.io/cloud/1multiarch-docker/
* [Multi-Architecture Docker Image](https://medium.com/illumination/multi-architecture-docker-image-3637ba05e5eb)
