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

## Asynchronous Programming vs Worker Threads ##

Node.js's single-threaded nature, while efficient for I/O-bound tasks due to its non-blocking event loop, can become a bottleneck for CPU-intensive operations. To address this, Node.js offers solutions: asynchronous programming with async/await and Worker Threads.

### 1. Asynchronous Programming with async/await: ###
Purpose:
Primarily designed for handling I/O-bound operations (like network requests, file system interactions, database queries) in a non-blocking manner.
Mechanism:
Leverages the event loop to manage multiple concurrent operations without creating new threads. When an I/O operation is initiated, the main thread continues executing other tasks while the operation runs in the background. Once the I/O operation completes, a callback is added to the event queue, and the event loop processes it when the main thread is free. async/await provides a more readable, synchronous-like syntax for managing Promises, which are the foundation of asynchronous operations.
Benefits:
Efficient for I/O-bound tasks, improves responsiveness, and simplifies asynchronous code compared to traditional callbacks.
Limitations:
**Does not parallelize CPU-intensive tasks; such tasks will still block the single main thread, making the application unresponsive during their execution.**

### 2. Worker Threads: ###
Purpose:
Designed to handle CPU-intensive tasks (like complex calculations, image/video processing, data transformations) in parallel, preventing them from blocking the main event loop.
Mechanism:
Creates separate threads, each with its own V8 instance, allowing CPU-bound operations to run concurrently on different CPU cores. Communication between the main thread and worker threads occurs via message passing or shared memory.
Benefits:
Enables true parallelism for CPU-bound tasks, significantly improving performance and responsiveness for applications with heavy computational workloads.
Limitations:
Adds overhead due to thread creation and communication, not suitable for I/O-bound tasks where the non-blocking event loop is more efficient, and requires careful management of shared resources and communication to avoid race conditions.
When to use which:
Use async/await (and the underlying asynchronous I/O APIs) for:
I/O-bound operations (network requests, file operations, database interactions).
Tasks that involve waiting for external resources without significant computation.
Use Worker Threads for:
CPU-intensive tasks that would otherwise block the main event loop. 
Tasks that can be broken down into independent units and processed in parallel.


## Profling ##

Node.js 성능 프로파일링은 애플리케이션의 병목 현상을 찾아 성능을 최적화하는 과정입니다. Node.js 자체적으로 제공하는 프로파일링 도구와 외부 도구를 사용하여 CPU 사용량, 메모리 사용량, I/O 작업 등을 분석할 수 있습니다. 

Node.js 프로파일링 방법:

1. Node.js 기본 프로파일러 사용:
--prof 옵션을 사용하여 Node.js 애플리케이션을 실행하면 프로파일링 로그 파일(예: isolate-0x123456789-v8.log)이 생성됩니다. 
생성된 로그 파일을 분석하여 CPU 사용량이 높은 함수나 코드 영역을 파악할 수 있습니다. 
--inspect 옵션과 함께 사용하면 크롬 개발자 도구에서 자세한 프로파일링 정보를 확인할 수 있습니다. 
perf 명령어를 사용하여 시스템 수준의 프로파일링을 수행할 수도 있습니다. 

2. clinic.js 사용:
clinic.js는 Node.js 애플리케이션의 성능 문제를 진단하고 해결하는 데 유용한 도구입니다. 
clinic doctor 명령어를 사용하여 실시간으로 성능 데이터를 수집하고 분석할 수 있습니다. 
clinic flame 명령어를 사용하여 CPU 프로파일링 결과를 시각화할 수 있습니다. 
clinic bubbleprof 명령어를 사용하여 메모리 누수를 추적할 수 있습니다. 

3. 외부 프로파일링 도구 사용:
New Relic, Keymetrics, N|Solid 와 같은 외부 모니터링 및 프로파일링 도구를 사용하여 Node.js 애플리케이션을 모니터링하고 프로파일링할 수 있습니다. 
이러한 도구들은 일반적으로 더 자세한 정보와 유용한 기능을 제공합니다. 

4. --trace-sync-io 옵션 사용:
동기식 I/O 작업을 감지하여 성능 병목 현상을 찾을 수 있습니다. 
성능 프로파일링 시 고려 사항:
프로파일링은 애플리케이션의 성능에 영향을 줄 수 있으므로, 프로덕션 환경에서 프로파일링을 수행하기 전에 테스트 환경에서 충분히 테스트해야 합니다. 
프로파일링 데이터는 매우 상세할 수 있으므로, 분석 도구를 사용하여 필요한 정보만 추출하는 것이 중요합니다. 
프로파일링 결과는 특정 시점의 데이터이므로, 애플리케이션의 성능 변화를 추적하려면 주기적으로 프로파일링을 수행해야 합니다. 
예시:
코드

```
# Node.js 기본 프로파일러 사용 예시
node --prof server.js  # 서버 실행 시 프로파일링 시작
# ... 서버 작업 수행 ...
# Ctrl + C 로 프로파일링 종료
node --prof-process isolate-0x123456789-v8.log > processed.txt # 로그 분석
```

참고:
node --help 명령어를 사용하여 Node.js 커맨드 라인 옵션을 자세히 확인 할 수 있습니다. 
chrome://inspect 를 사용하여 Chrome DevTools를 통해 프로파일링을 수행할 수 있습니다. 
비효율적인 코드를 찾았다면, 코드를 개선하거나 비동기 처리 방식으로 변경하여 성능을 향상시킬 수 있습니다. 


* [Node CPU 점유율 최적화 경험기](https://hyperconnect.github.io/2020/02/11/Node-cpu-debug.html)


## Performance Tunning ##

* [Quick benchmark of the AWS Graviton2 for Node.js applications](https://medium.com/@meego/quick-benchmarking-of-the-aws-graviton2-for-node-js-applications-1ffb78992acc)
* https://nodejs.org/en/learn/getting-started/profiling
* [Node.js Performance Tuning: Advanced Techniques to Follow](https://dzone.com/articles/nodejs-performance-tuning-advanced-techniques)
* [How to measure and improve Node.js performance](https://raygun.com/blog/improve-node-performance/#profiler)
