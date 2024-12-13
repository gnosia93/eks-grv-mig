## eks-grv-mig ## 
![](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/images/ws-arch.png)

이 워크샵에서는 x86 노드로 구성된 eks 클러스터를 aws graviton 인스턴스로 전환하는 방법을 설명합니다. terraform, kubectl, eksctl, helm 등을 로컬 PC 에 설치하고, 필요한 모든 리소스가 프로비저닝 합니다. 

## 시나리오 ##

1. [EKS 클러스터 생성하기(eks provision)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/1.infra.md)

2. [Multi 아키텍처 이미지 빌드하기(multi architecture image build)](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/2.multi-arch-image.md)

3. [X86 노드에서 어플리케이션 실행하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/3.x86-app.md)
       
4. [Graviton 노드 추가하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/4.graviton-nodegroup.md)

5. [어플리케이션 마이그레이션 하기](https://github.com/gnosia93/eks-grv-mig/blob/main/tutorial/5.app-mig.md)
   
6. 성능 측정하기
    - [프로메테우스 / 그라파나 설치](https://github.com/gnosia93/eks-grv-adp/blob/main/tutorial/7.prometheus.md)
    - locust ?? 성능 측정(?)


## Revision History ##
* 2024-12-13 First Released
