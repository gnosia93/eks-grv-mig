## 시나리오 ##

1. 클러스터 생성하기 X86 노드그룹 2개로 생성
2. 자바 어플리케이션 배포하기 (X86 디플로이먼트)
3. graviton 노드 그룹 추가하기
4. 멀티 아키텍처 이미지 빌드하기
    - buildx 사용해 보기.
    - 인스턴스 타입별로 빌드하기
5. 배포하기
    - 카나리 배포 / 롤백하기 
    - 블루/그린 배포 / 롤백하기 
6. CI-CD 파이프 라인과 연결하기 (젠킨스)
7. 디플로이먼트 재 배포하기
   - 카라리 배포하기.
   - 롤백하기.
8. 성능 측정하기
9. 로그 관찰하기  


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



