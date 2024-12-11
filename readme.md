## 시나리오 ##

1. [EKS 클러스터 생성하기(eks provision)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/1.infra.md)

2. [Multi 아키텍처 이미지 빌드하기(multi architecture image build)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-image.md)

3. [X86 노드에 어플리케이션 실행하기]()
       
4. [Graviton 노드 추가하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/3.graviton-nodegroup.md)

5. Graviton 노드에 어플리케이션 배포하기
    - 파드 하나만 arm 노드에 배치해 보기 (서비스 pod selector 이용)
    - 카나리 배포 ; node affinity 를 이용한다. 결국 모두다 arm 노드로 배치될 예정이므로, ...      
    - 블루/그린 배포 ; node selector 를 이용한다.
    - 롤백하기 
      
6. CI 파이프 라인과 연결하기
    - [젠킨스 설치하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/5.jenkins.md)
    - [파이프 라인 구성하기]
      
7. CD 파이프 라인 구축하기 (Spinnaker)

8. 성능 측정하기
    - [프로메테우스 / 그라파나 설치](https://github.com/gnosia93/eks-grv-adp/blob/main/tutorial/7.prometheus.md)
    - locust ?? 성능 측정(?)
    
9. 로그 관찰하기  
   - fluentd 설치
   - kubectl logs 

## ... ##

app to graviton / db to graviton

* taint for graviton node
* scheduing graviton pod with deployment canary.
* daemonset migration
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
