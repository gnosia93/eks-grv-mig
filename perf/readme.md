
  
## LSE ##

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

below output is mac book JVM flags 
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
