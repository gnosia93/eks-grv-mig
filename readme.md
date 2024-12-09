## 시나리오 ##

1. 클러스터 생성하기 X86 노드그룹 2개로 생성
2. 자바 어플리케이션 배포하기
3. graviton 노드 그룹 추가하기
4. 이미지 빌드하기.
5. 디플로이먼트 재 배포하기
   - 카라리 배포하기.
   - 롤백하기.
6. 성능 측정하기
7. 로그 관찰하기  


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



## 레퍼런스 ##

* https://workshops.aws/?tag=Graviton
* https://github.com/aws-samples/graviton-workshop/tree/main 
* https://aws-startup-lofts.com/apj/event/36ddd64c-30aa-438f-98f3-2f1a1dfb71eb
* https://aws-experience.com/emea/uki/e/80d85/graviton-developer-day
* https://www.eksworkshop.com/docs/fundamentals/managed-node-groups/graviton/
* https://aws-experience.com/emea/smb/e/70e7a/graviton-developer-day-for-python-go-and-java
* https://ec2spotworkshops.com/karpenter/050_karpenter/multiple_architectures.html
* https://medium.com/@iyer.hareesh/cost-optimization-with-aws-graviton-b045bcfaeaf3


