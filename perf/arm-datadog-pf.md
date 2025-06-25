* [Continuous Node.js Profiling](https://www.datadoghq.com/dg/apm/profiler/nodejs-continuous-profiler/?utm_source=google&utm_medium=paid-search&utm_campaign=dg-profiler-apac-nodejs&utm_keyword=%2Bprofile%20%2Bnodejs&utm_matchtype=p&igaag=171692363888&igaat=&igacm=15419171172&igacr=708880139913&igakw=%2Bprofile%20%2Bnodejs&igamt=p&igant=g&utm_campaignid=15419171172&utm_adgroupid=171692363888&gad_source=1&gad_campaignid=15419171172&gbraid=0AAAAADFY9Nlr9ntJXY3BnnnhCuJEcXhU0&gclid=CjwKCAjwvO7CBhAqEiwA9q2YJQsBDkc-tDtVURrXtcuxiXIp7mBq6xbNCK8MKaFGposf0O5bXjbuOxoCwVAQAvD_BwE)

![](https://github.com/gnosia93/eks-on-arm/blob/main/perf/imagaes/datadog-pf.-2.png)

Datadog's Continuous Profiler can be used to profile ARM-based applications. The profiler is designed to run continuously in production with minimal overhead, providing insights into code performance, including CPU usage, memory allocation, and method execution times. This allows developers to identify performance bottlenecks and optimize their applications. 
Here's how Datadog's Continuous Profiler can be used for ARM applications:

1. Enabling the Profiler:
The profiler is typically enabled through Datadog's APM (Application Performance Monitoring) libraries. 
For example, if you're using Datadog's tracing libraries for your application, you can enable the profiler by configuring the library.
The specific configuration steps will depend on the programming language and the Datadog library version being used. 

2. Analyzing Performance Data:
Once the profiler is enabled, it will start collecting performance data about your application. 
Datadog provides various tools for analyzing this data, including flame graphs, which visually represent the call stack and the time spent in each function. 
You can use these tools to identify the most resource-intensive parts of your code and pinpoint potential areas for optimization. 

3. Key Benefits:
Continuous Monitoring:
The profiler runs continuously in production, allowing you to identify performance issues as they occur. 
Low Overhead:
Datadog's profiler is designed to have minimal impact on application performance, making it suitable for production environments. 
Language and Platform Support:
The profiler supports various programming languages and platforms, including those commonly used for ARM-based applications. 
Integration with APM:
The profiler seamlessly integrates with Datadog's APM, allowing you to correlate profiling data with other performance metrics like traces and logs. 
Production-Ready:
The profiler is designed to be used in production environments, eliminating the need for separate testing environments to reproduce performance issues. 

4. Example:
For example, you might be running a Node.js application on an ARM-based server.
You can enable the Datadog profiler within your Node.js application by using the dd-trace library. 
Once enabled, the profiler will start collecting data about your application's CPU usage, memory allocation, and other performance metrics. 
You can then use Datadog's dashboards and tools to analyze this data and identify any performance bottlenecks. 
By leveraging Datadog's Continuous Profiler, developers can gain valuable insights into their ARM-based application's performance and optimize it for better efficiency and user experience. 

* https://docs.datadoghq.com/ko/profiler/
* [Datadog on Profiling in Production](https://www.youtube.com/watch?v=5ffJ8Zzg4YY)
