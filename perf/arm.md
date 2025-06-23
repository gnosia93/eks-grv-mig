* Why I think ARM servers will always be slow - https://semiwiki.com/forum/threads/why-i-think-arm-servers-will-always-be-slow.11163/
* ARM vs. x86: Differences & similarities of both architectures - https://emteria.com/blog/arm-vs-x86
* Arm64 performance and Arm memory model (barriers) - https://community.amperecomputing.com/t/arm64-performance-and-arm-memory-model-barriers/891
  * https://yoojin99.github.io/cs/Memory-Barrier/
  * https://www.infoq.com/articles/memory_barriers_jvm_concurrency/


## .NET CLR shows more lock contention on ARM than x86 ##

While it's not a universal rule that the .NET CLR (Common Language Runtime) shows more lock contention on ARM than x86, there are some nuances to consider. The CLR's memory model on ARM is designed to be as strong as possible while minimizing performance impact, and it might expose differences in lock behavior compared to x86 in certain scenarios. 
Here's a breakdown:
Memory Model Differences:
The CLR's memory model on x86 is inherently strong due to the processor's architecture. On ARM, the CLR team has worked to ensure type safety and a strong memory model, but they also aimed to avoid performance penalties by carefully inserting memory barriers. 
Potential for Contention:
If your code relies on lock-free algorithms that are sensitive to the specific memory model guarantees of the x86 CLR, you might see different behavior on ARM, potentially leading to more lock contention. 
volatile Keyword:
To mitigate this, you can use the volatile keyword to explicitly mark shared variables that are accessed without locks. The CLR will then handle the memory ordering guarantees for those variables. 
Performance:
Performance benchmarks generally show that .NET code execution performance scales similarly on ARM, x86, and x64 when compared to native C++ code, indicating that the CLR's memory model implementation on ARM doesn't significantly hinder performance in most cases. 
Lock Contention Reduction:
Techniques for reducing lock contention in any environment, including both x86 and ARM, include minimizing the time spent under a lock, reducing the scope of the lock, and using more efficient locking mechanisms. 
