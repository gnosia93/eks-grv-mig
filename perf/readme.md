for Java JVM
  
## [LSE](https://learn.arm.com/learning-paths/servers-and-cloud-computing/lse/intro/) ##

To determine if your JVM supports ARM's LSE (Large System Extensions) instructions, you can check if the JVM was compiled with the necessary flags and if the target processor supports it. You can verify this by examining the JVM's command-line arguments or by inspecting the compiled code for LSE instructions. If using OpenJDK, you can also enable the UseLSE flag in the JVM options and use tools like ldd to check dynamic linking. 
Here's a more detailed explanation:
1. Check JVM Command-line Arguments:
Examine the command-line arguments used to start the JVM. If the -XX:+UseLSE flag is present, the JVM is explicitly instructed to use LSE instructions if available. 
Also look for -march=armv8.1-a or similar flags, which indicate compilation for a specific ARM architecture version that includes LSE. 
2. Inspect the Compiled Code (for advanced users):
If you have access to the compiled class files or native libraries, you can use tools like objdump or readelf on Linux to examine the instructions. Look for specific LSE instructions like LDADD, LDADDL, LDADDA, LDADDAL, or CAS (compare-and-swap). 
These instructions are part of the ARMv8.1 architecture and later and are used for atomic operations. 
3. Verify Dynamic Linking (OpenJDK):
For OpenJDK, you can use the ldd command to check the dynamic libraries the JVM is linked against.
If the JVM is linked against a version of libz that supports LSE (e.g., a custom-built zlib-cloudflare), it indicates that LSE support is available. 
4. Check Processor Support:
If you are using a cloud instance, like an Ampere Altra, the processor will likely support LSE, and the JVM will automatically enable it if compiled accordingly. 
For other ARM processors, consult the processor's technical reference manual to determine if it supports LSE. 
5. Consider the -moutline-atomics flag (for portability):
If you need the JVM to run on a wider range of ARMv8 systems, including those that may not have LSE support, compile with the -moutline-atomics flag. This ensures that the JVM uses a fallback mechanism for atomic operations when LSE is not available. 
By following these steps, you can determine if your JVM is utilizing ARM's Large System Extensions for improved performance on ARM processors. 

* [Improving Java performance on Neoverse N1 systems](https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/java-performance-on-neoverse-n1)
* [https://amperecomputing.com/tuning-guides/unlocking-java-performance-tuning-guide](https://amperecomputing.com/tuning-guides/unlocking-java-performance-tuning-guide)


## JVM Option Check ##

below output is mac book JVM flags, which mean if JVM supports native instructions and some JVM spedific optimizations  
```
$ java -XX:+PrintFlagsFinal -version | grep Use

     bool AllowUserSignalHandlers                  = false                                     {product} {default}
     bool G1UseAdaptiveConcRefinement              = true                                      {product} {default}
     bool G1UseAdaptiveIHOP                        = true                                      {product} {default}
     bool UseAES                                   = false                                     {product} {default}
     bool UseAdaptiveGenerationSizePolicyAtMajorCollection  = true                             {product} {default}
     bool UseAdaptiveGenerationSizePolicyAtMinorCollection  = true                             {product} {default}
     bool UseAdaptiveNUMAChunkSizing               = true                                      {product} {default}
     bool UseAdaptiveSizeDecayMajorGCCost          = true                                      {product} {default}
     bool UseAdaptiveSizePolicy                    = true                                      {product} {default}
     bool UseAdaptiveSizePolicyFootprintGoal       = true                                      {product} {default}
     bool UseAdaptiveSizePolicyWithSystemGC        = false                                     {product} {default}
     bool UseBASE64Intrinsics                      = true                                      {product} {default}
     bool UseBiasedLocking                         = false                                     {product} {default}
     bool UseBimorphicInlining                     = true                                   {C2 product} {default}
     bool UseBlockZeroing                          = true                                 {ARCH product} {default}
     bool UseCMoveUnconditionally                  = false                                  {C2 product} {default}
     bool UseCRC32                                 = true                                 {ARCH product} {default}
     bool UseCodeAging                             = true                                      {product} {default}
     bool UseCodeCacheFlushing                     = true                                      {product} {default}
     bool UseCompiler                              = true                                      {product} {default}
     bool UseCompressedClassPointers               = true                           {product lp64_product} {ergonomic}
     bool UseCompressedOops                        = true                           {product lp64_product} {ergonomic}
     bool UseCondCardMark                          = false                                     {product} {default}
     bool UseCountedLoopSafepoints                 = true                                   {C2 product} {default}
     bool UseCounterDecay                          = true                                      {product} {default}
     bool UseCryptoPmullForCRC32                   = false                                {ARCH product} {default}
     bool UseDivMod                                = true                                   {C2 product} {default}
     bool UseDynamicNumberOfCompilerThreads        = true                                      {product} {default}
     bool UseDynamicNumberOfGCThreads              = true                                      {product} {default}
     bool UseEmptySlotsInSupers                    = true                                      {product} {default}
     bool UseFMA                                   = true                                      {product} {default}
     bool UseFPUForSpilling                        = false                                  {C2 product} {default}
     bool UseFastJNIAccessors                      = true                                      {product} {default}
     bool UseG1GC                                  = true                                      {product} {ergonomic}
     bool UseGCOverheadLimit                       = true                                      {product} {default}
     bool UseHeavyMonitors                         = false                                     {product} {default}
     bool UseInlineCaches                          = true                                      {product} {default}
     bool UseInterpreter                           = true                                      {product} {default}
     bool UseJumpTables                            = true                                   {C2 product} {default}
     bool UseLSE                                   = true                                 {ARCH product} {default}
     bool UseLargePages                            = false                                  {pd product} {default}
     bool UseLargePagesIndividualAllocation        = false                                  {pd product} {default}
     bool UseLoopCounter                           = true                                      {product} {default}
     bool UseLoopInvariantCodeMotion               = true                                   {C1 product} {default}
     bool UseLoopPredicate                         = true                                   {C2 product} {default}
     bool UseMaximumCompactionOnSystemGC           = true                                      {product} {default}
     bool UseNUMA                                  = false                                     {product} {ergonomic}
     bool UseNUMAInterleaving                      = false                                     {product} {ergonomic}
     bool UseNeon                                  = false                                {ARCH product} {default}
     bool UseNotificationThread                    = true                                      {product} {default}
     bool UseOnStackReplacement                    = true                                   {pd product} {default}
     bool UseOnlyInlinedBimorphic                  = true                                   {C2 product} {default}
     bool UseOptoBiasInlining                      = false                                  {C2 product} {default}
     bool UsePSAdaptiveSurvivorSizePolicy          = true                                      {product} {default}
     bool UseParallelGC                            = false                                     {product} {default}
     bool UsePerfData                              = true                                      {product} {default}
     bool UsePopCountInstruction                   = true                                      {product} {default}
     bool UseProfiledLoopPredicate                 = true                                   {C2 product} {default}
     bool UseSHA                                   = false                                     {product} {default}
     bool UseSIMDForArrayEquals                    = true                                 {ARCH product} {default}
     bool UseSIMDForBigIntegerShiftIntrinsics      = true                                 {ARCH product} {default}
     bool UseSIMDForMemoryOps                      = false                                {ARCH product} {default}
     uint UseSVE                                   = 0                                    {ARCH product} {default}
     bool UseSerialGC                              = false                                     {product} {default}
     bool UseSharedSpaces                          = true                                      {product} {default}
     bool UseShenandoahGC                          = false                                     {product} {default}
     bool UseSignalChaining                        = true                                      {product} {default}
     bool UseSimpleArrayEquals                     = false                                {ARCH product} {default}
     bool UseStringDeduplication                   = false                                     {product} {default}
     bool UseSubwordForMaxVector                   = true                                   {C2 product} {default}
     bool UseSuperWord                             = true                                   {C2 product} {default}
     bool UseTLAB                                  = true                                      {product} {default}
     bool UseThreadPriorities                      = true                                   {pd product} {default}
     bool UseTypeProfile                           = true                                      {product} {default}
     bool UseTypeSpeculation                       = true                                   {C2 product} {default}
     bool UseVectorCmov                            = false                                  {C2 product} {default}
     bool UseXMMForArrayCopy                       = false                                     {product} {default}
     bool UseZGC                                   = false                                     {product} {default}
openjdk version "17.0.8" 2023-07-18 LTS
OpenJDK Runtime Environment Corretto-17.0.8.7.1 (build 17.0.8+7-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.8.7.1 (build 17.0.8+7-LTS, mixed mode, sharing)
```

## [JVM Perf Tunning](https://github.com/aws/aws-graviton-getting-started/blob/main/java.md) ##
### Java JVM Options ###
There are numerous options that control the JVM and may lead to better performance.

* Flags -XX:-TieredCompilation -XX:ReservedCodeCacheSize=64M -XX:InitialCodeCacheSize=64M have shown large (1.5x) improvements in some Java workloads. Corretto 17 needs two additional flags: -XX:CICompilerCount=2 -XX:CompilationMode=high-only. ReservedCodeCacheSize/InitialCodeCacheSize should be equal and can be in range: 64M...127M. The JIT compiler stores generated code in the code cache. The flags change the size of the code cache from the default 240M to the smaller one. The smaller code cache may help CPU to improve the caching and prediction of jitted code. The flags disable the tiered compilation to make the JIT compiler able to use the smaller code cache. These are helpful on some workloads but can hurt on others so testing with and without them is essential.

* Crypto algorithm AES/GCM used by TLS has been optimized for Graviton. On Graviton2 GCM encrypt/decrypt performance improves by 3.5x to 5x. The optimization is enabled by default in Corretto and OpenJDK 18 and later. The optimization has been backported to Corretto and OpenJDK 11 and 17 and can be enabled with the flags -XX:+UnlockDiagnosticVMOptions -XX:+UseAESCTRIntrinsics. As an alternative, you can use Amazon Corretto Crypto Provider JNI libraries.

### Looking for x86 shared-objects in JARs ###
Java JARs can include shared-objects that are architecture specific. Some Java libraries check if these shared objects are found and if they are they use a JNI to call to the native library instead of relying on a generic Java implementation of the function. While the code might work, without the JNI the performance can suffer.

A quick way to check if a JAR contains such shared objects is to simply unzip it and check if any of the resulting files are shared-objects and if an aarch64 (arm64) shared-object is missing:

$ unzip foo.jar
$ find . -name "*.so" -exec file {} \;

For each x86-64 ELF file, check there is a corresponding aarch64 ELF file in the binaries. With some common packages (e.g. commons-crypto) we've seen that even though a JAR can be built supporting Arm manually, artifact repositories such as Maven don't have updated versions. To see if a certain artifact version may have Arm support, consult our [Common JARs with native code Table](https://github.com/aws/aws-graviton-getting-started/blob/main/CommonNativeJarsTable.md). Feel free to open an issue in this GitHub repo or contact us at ec2-arm-dev-feedback@amazon.com for advice on getting Arm support for a required Jar.

### Remove Anti-patterns ###
Anti-patterns can affect the performance on any instance family, but the level of impact can be different. Below is a list of anti-patterns we have found to be particularly impactful on Graviton:

Excessive exceptions: Throwing exceptions and generating stack-traces has been observed to cost up to 2x more on Graviton platforms compared to x86. We recommend not to use Java exceptions as control flow, and to remove exceptions when they appear in the hot-code path. Identifying hot exceptions can be done using function profilers like Aperf, Async-profiler, or Linux perf. Overhead can be mitigated some by using the **-XX:+OmitStackTraceInFastThrow** JVM flag to allow the Java runtime to optimize the exception flow for some hot paths. The best solution is to avoid the exceptions as much as possible.

## Vector Instruction ###

* [Improving performance with SIMD intrinsics in three use cases](https://stackoverflow.blog/2020/07/08/improving-performance-with-simd-intrinsics-in-three-use-cases/)
* [SVC Deep Dive](https://www.stonybrook.edu/commcms/ookami/support/_docs/5%20-%20Advanced%20SVE.pdf)
