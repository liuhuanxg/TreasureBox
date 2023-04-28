---
title: python分析模块
---

---
title: python分析模块
---

 

**sampling** profilers VS **tracing** profilers

tracingprofilers记录程序所调用的每个函数，然后在最后打印出报告。 samplingprofilers采用更加统计化的方法 - 他们每隔几毫秒记录程序的堆栈情况，然后报告结果。

使用sampling profilers而不是tracing profilers的主要原因是sampling profilers的开销较低。 如果每秒只抽取20或200个样本，那不会花费多少时间。 而且它们非常有效率 - 如果遇到严重的性能问题（比如80％的时间花费在1个慢速函数上），那么每秒200个样本通常就足以确定那个函数的问题所在了。



- cProfile: Python内置的分析工具，c语言编写。

  - 兼容性：python2/python3

  - 文档：https://docs.python.org/zh-cn/3/library/profile.html

  - 使用方式：通过cprofile启动python程序

    ```bash
    python -m cProfile -s cumtime sample.py
    ```

  - 优势：python内置分析器；

  - 劣势：并不适合对多线程的长时间运行程序进行分析，默认只会对主线程进行分析，且分析方法是对正在运行的程序进行代码注入，会影响性能；

- memory_profiler：一个监控进程内存消耗的模块，也可以逐行分析 Python 程序的内存消耗。具体实现依赖 psutil 模块的纯 Python 模块。

  - 兼容性：python2/python3

  - 文档：https://github.com/pythonprofilers/memory_profiler/blob/master/README.rst

    实践例子：https://programming.insutanto.net/2020-03/python-memory-profile/python_memory_profiler

  - 使用方式：使用memory_profile启动python程序或在程序中import装饰器，需要改动代码；

  - 优势：可以针对代码级别进行内存消耗的分析；

  - 劣势：对代码具有侵入性；

- PyFlame: Uber开源的性能分析工具，使用C++实现，利用ptrace系统调用来收集分析信息；

  - 兼容性：python2/python3

  - 文档：https://github.com/uber/pyflame

    实践例子：https://meteorix.github.io/2019/05/24/pyflame/

  - 使用方式：

    ```bash
     # attach to process PID 1024 for duration of 60 seconds and sample every 0.05 seconds
    $ pyflame -s 60 -r 0.05 -p 1024
    ....
     
    $ pyflame --rate=0.005 -o profile.txt -t python sample.py
    Execution time : 1.97 sec
     
    # convert profile.txt to a flame graph
    flamegraph.pl &lt; profile.txt > profile.svg
    ```

    

  - 优势：通过attach的方式来分析进程，对代码无侵入性，采样流程由单独的进程负责，不会影响现有进程运行，支持多线程/进程；

  - 劣势：不支持OSX/Windows平台，而且项目已经不再维护了，使用起来可能会有坑；

- Py-spy: 使用Rust编写的python性能分析工具，实现逻辑是通过系统调用读取python程序的内存，通过解析PyFrameObject结构来获取堆栈信息。

  - 兼容性：python2/python3

  - 文档：https://github.com/benfred/py-spy

  - 使用方式：使用attach的方式进行，支持record(记录)，top(列出耗时的函数)，dump(导出程序的堆栈信息)

    ```bash
    py-spy record -o profile.svg --pid 12345
    # OR
    py-spy record -o profile.svg -- python myprogram.py
    
    py-spy top --pid 12345
    # OR
    py-spy top -- python myprogram.py
    
    
    py-spy dump --pid 12345
    ```

  - 优势：通过attach的方式来分析进程，对代码无侵入性，采样流程由单独的进程负责，不会影响现有进程运行，支持多线程/进程，支持功能较多，且项目一直在持续维护；

  - 劣势：需要使用sudo权限进行attach或者修改全局的系统设置；



其他：

- pyroscope：一个golang编写的持续性能分析平台，整合了各种分析工具和前端显示；

- github: https://github.com/pyroscope-io/pyroscope 

  中文介绍：https://github.com/pyroscope-io/pyroscope/blob/main/translations/README.ch.md