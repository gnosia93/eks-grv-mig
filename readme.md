## eks-grv-mig ## 
![](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/images/ws-archi-1.png)
이 워크샵에서는 x86 노드로 구성된 eks 클러스터를 aws graviton 인스턴스로 전환하는 방법을 설명합니다. 실습을 진행하기 위해서 terraform, kubectl, eksctl, helm 등을 로컬 PC 에 설치하고, terraform 으로 인프라를 프로비저닝 합니다. AWS 계정은 이미 생성되어 있다고 가정하므로 본 워크샵에서는 계정 생성 및 억세스 키 설정에 대해서 다루지 않습니다.  

## Scenario ##

1. [EKS 클러스터 생성하기(eks provision)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/1.infra.md)

2. [멀티 아키텍처 이미지 만들기(multi architecture image build)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-image.md)
       
   - [AWS Codepipeline Native Build](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-codepipe.md)
   - [Jenkins CI Pipline Native Build](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-jenkins.md)

3. [X86 노드에서 어플리케이션 실행하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/3.x86-app.md)
       
4. [Graviton 노드 추가하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/4.graviton-nodegroup.md)

5. [어플리케이션 마이그레이션 하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/5.app-mig.md)

    - [ALB 가중치 기반 라우팅 활용하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/5-1.alb-weight-routing.md)
    - [Istio 버추얼 서비스 활용하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/5-2.istio-routing.md)      
  
6. 성능 측정하기
   
    - [프로메테우스 / 그라파나 설치](https://github.com/gnosia93/eks-grv-adp/blob/main/tutorial/6.perf-prometheus.md)
    - [대시보드 설정](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/6.perf-mon.md)
    - [부하 테스트(x86 vs 그라비톤)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/6.perf-ab.md)



## Revision History ##
* 2024-12-13 First Released

## Reference ##

* https://www.eksworkshop.com/
* https://workshops.aws/categories/Containers?tag=Graviton
