## Node Architecture ##

* [Node.js가 왜 싱글 스레드로 불리는지 "정확한 이유"를 알고 계신가요?](https://helloinyong.tistory.com/350)
* [The V8 JavaScript Engine](https://nodejs.org/en/learn/getting-started/the-v8-javascript-engine#the-v8-javascript-engine)

Node.js는 기본적으로 싱글 스레드 기반으로 작동하지만, libuv 라이브러리를 통해 비동기 I/O를 처리하여 멀티 스레드처럼 동작할 수 있습니다. 이벤트 루프와 작업자 스레드 풀을 활용하여 효율적인 병렬 처리를 지원합니다. 
Node.js의 스레드 구조는 다음과 같이 요약할 수 있습니다: 

* 싱글 스레드 기반: Node.js는 메인 스레드에서 이벤트 루프를 통해 모든 작업을 처리합니다.
* 이벤트 루프: 비동기 작업을 처리하고 콜백 함수를 실행하는 역할을 담당합니다.
* libuv: Node.js의 비동기 I/O 작업을 처리하는 라이브러리로, 내부적으로 작업자 스레드 풀을 가지고 있습니다.
* 작업자 스레드 풀: 시간이 오래 걸리는 CPU 집약적인 작업이나 파일 시스템 접근과 같은 I/O 작업을 메인 스레드로부터 분리하여 처리합니다.
* 워커 스레드: Node.js v10.5.0 이상에서 추가된 기능으로, 개발자가 명시적으로 생성하여 병렬 처리를 수행할 수 있는 스레드입니다.

#### 자세한 설명: ####

#### 싱글 스레드와 이벤트 루프: ####

Node.js는 기본적으로 싱글 스레드 모델을 사용합니다. 하나의 스레드에서 모든 코드가 실행되므로 동시성 문제는 발생하지 않지만, CPU 연산이 오래 걸리는 작업은 다른 작업의 진행을 막을 수 있습니다. 이러한 문제를 해결하기 위해 Node.js는 이벤트 루프를 사용하여 비동기 방식으로 I/O 작업을 처리합니다. 이벤트 루프는 작업을 큐에 넣고 완료되면 콜백 함수를 실행하여 논블로킹 방식으로 작업을 처리합니다.

#### libuv와 작업자 스레드 풀: ####
libuv는 Node.js의 핵심 라이브러리로, 비동기 I/O 작업을 처리합니다. 내부적으로 작업자 스레드 풀을 가지고 있어, 시간이 오래 걸리는 작업을 메인 스레드에서 분리하여 처리할 수 있도록 합니다. 예를 들어 파일 읽기나 네트워크 요청과 같은 I/O 작업은 작업자 스레드 풀에서 처리되고, 결과는 콜백 함수를 통해 메인 스레드로 전달됩니다.

#### 워커 스레드: ####
워커 스레드는 개발자가 직접 생성하여 사용할 수 있는 멀티스레딩 기능을 제공합니다. 무거운 계산이나 CPU 집약적인 작업을 메인 스레드와 분리하여 병렬로 처리할 수 있도록 합니다. 워커 스레드는 이벤트 루프와는 별도로 동작하며, 서로 데이터를 주고받을 수 있습니다. 

#### 요약: ####
Node.js는 기본적으로 싱글 스레드 기반이지만, libuv와 이벤트 루프를 통해 효율적인 비동기 처리를 제공합니다. 또한 워커 스레드를 통해 멀티 스레드 프로그래밍도 가능하며, 이를 통해 복잡한 연산이나 I/O 작업을 병렬로 처리할 수 있습니다. 


Node.js performance on ARM architecture is a relevant topic, especially with the rise of ARM-based servers and devices like AWS Graviton instances and Apple M-series chips.

General Performance Characteristics:

Efficiency:
ARM processors are known for their power efficiency, which can translate to lower operational costs in cloud environments or extended battery life in embedded systems.

Performance Variability:
Performance can vary significantly between different ARM implementations and specific workloads. Factors like core count, clock speed, cache size, and memory bandwidth all play a role.

Workload Suitability:
Node.js, with its single-threaded event loop and non-blocking I/O model, can be well-suited for I/O-bound workloads on ARM. CPU-intensive tasks might see less benefit or even performance regressions compared to highly optimized x86 architectures, especially if V8's instruction scheduling isn't fully optimized for the specific ARM core.

Specific Considerations for Node.js on ARM:

Native ARM Builds:
Ensure you are running a native ARM build of Node.js, not an emulated version (e.g., via Rosetta 2 on Apple Silicon), to maximize performance.

V8 Optimization:
The V8 JavaScript engine, which powers Node.js, continuously improves its ARM support and optimizations. Newer versions of Node.js typically include these enhancements.

Benchmarking:
Conduct thorough benchmarking with your specific Node.js application and workload on the target ARM hardware to accurately assess performance and identify potential bottlenecks. Tools like autocannon or wrk can be used for this purpose.

Resource Utilization:
Monitor CPU and memory usage to ensure efficient resource allocation and identify any potential performance issues or bottlenecks related to your application's code or dependencies.

In summary, Node.js can perform well on ARM, particularly for I/O-bound applications and in environments where power efficiency is a priority. However, careful consideration of the specific ARM hardware, Node.js version, and application workload is necessary to achieve optimal performance.



## [Node addon / native module](https://nodejs.org/api/addons.html) ##

Node.js supports the use of native C and C++ code through dynamically linked shared objects, commonly referred to as addons or native modules. These modules are compiled C/C++ code that can be loaded and interacted with from within your JavaScript application.

This capability allows developers to:
Leverage existing C/C++ libraries: Integrate high-performance or specialized functionalities written in C/C++ directly into Node.js applications.
Optimize performance-critical sections: Handle computationally intensive tasks or low-level operations more efficiently than pure JavaScript.
Interact with system resources: Access operating system-specific functionalities or hardware directly.  
Tools like node-gyp are typically used to compile these native modules, and the Node-API (N-API) provides a stable API for building these addons, ensuring compatibility across different Node.js versions.


## Performance Tunning ##

* [Quick benchmark of the AWS Graviton2 for Node.js applications](https://medium.com/@meego/quick-benchmarking-of-the-aws-graviton2-for-node-js-applications-1ffb78992acc)
* https://nodejs.org/en/learn/getting-started/profiling
* [Node.js Performance Tuning: Advanced Techniques to Follow](https://dzone.com/articles/nodejs-performance-tuning-advanced-techniques)
* [How to measure and improve Node.js performance](https://raygun.com/blog/improve-node-performance/#profiler)
