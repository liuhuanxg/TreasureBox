---
title: goroutine
---

# Goroutine

### go语言中的进程、线程、协程、并发和并行、goroutine启动，goroutine特点，runtime包函数



```

   goroutine是go语言中的协程，MPG概念中重要的一环，当goroutine运行时，系统会分配一个系统级的线程M给逻辑处理器，逻辑处理器的个数可以设置，默认占用所有的核数。
   若干个goroutine在逻辑处理器中顺序执行。
   当goroutine阻塞时，比如打开文件时，调度器就会降这个线程与处理器分离，并创建一个新线程来运行这个处理器上提供的服务。当被阻塞的系统调用执行完成并返回时，
   对应的goroutine会放回到本地运行队列，而之前的线程会保存好，之后可以继续使用。
   调用方式 go funcname()

goroutine特点：
   1.go的执行是非阻塞的，不会等待。
   2.go后边的函数的返回值会被忽略。
   3.调度器不会保证多个goroutine的执行次序
   4.没有父子goroutine的概念，所有的goroutine是平等的被调度和被执行的。
   5.go程序在执行时会单独为main函数创建一个goroutin，遇到其他go关键字时再去创建其他的goroutine
   6.主函数返回时，所有的goroutine都会被直接打断，程序退出;所以必须要在主函数中进行阻塞，才能保证goroutine执行完成。
   7.go没有暴露goroutine id给用户，所以不能在一个goroutine里面显示的操作另一个goroutine，不过runtime包提供了一些函数和设置goroutine的相关信息
   8.runtime.NumGoroutine返回一个进程的所有goroutine数，main()的goroutine也被算在里面。因此实际创建的goroutine数量为扣除main()的goroutine数。

   一旦主goroutine中的代码（也就是main函数中的代码执行完毕），当前Go程序就会结束运行。如此一来，如果在Go程序结束的那一刻还有goroutine未得到运行机会，就不会再获得运行机会，其中的代码不会再执行。
   严谨地讲，go语言不会保证这些goroutine会以怎样的顺序运行。由于主goroutine会与我们手动启用的其他goroutine一起接受调度。
      又因为调度器很可能会在goroutine中的代码只执行了一部分的时候暂停，以期所有的goroutine有更公平的运行机会。所以哪个goroutine先执行完，哪个goroutine后执行完往往是不可预知的。
   runtime包函数：在go语言程序运行时（runtime）实现了一个小型的任务调度器，提供了修改Go语言运行时配置参数的能力。这套调度器的工作原理类似于系统调度线程，go程序调度器可以高效地将CPU资源分配给每一个任务。
      GOMAXPROCS：设置逻辑CPU核数。
         fmt.Println("GOMAXPROCS0", runtime.GOMAXPROCS(0))      查询当前的GOMAXPROCS值
         fmt.Println("GOMAXPROCS1", runtime.GOMAXPROCS(1))  设置单核心执行
         fmt.Println("GOMAXPROCS2", runtime.GOMAXPROCS(2))  设置多核并发执行
      Goexit：结束当前goroutine的运行，Goexit在结束当前goroutine运行之前会调用当前goroutine已经注册的defer。
            Goexit并不会产生panic，所以该goroutine defer里面的recover调用都返回nil。
            调用runtime.Goexit将立即终止当前goroutine执行，调度器确保所有已注册defer延迟调用被执行。
      Gosched：goroutine可能切换的点：
      			 1. I/O、select
      			 2. channel
      			 3. 等待锁
      			 4. 函数调用(有时)
      			 5. runtime.Gosched()
					和协程yield作用类似，Gosched是放弃当前调度执行机会，将当前goroutine暂停，放回队列等待下次被调度执行。
					用于让出CPU时间片。类似于接力赛，A先跑了一会碰到代码runtime.Gosched()就把接力棒交给B，A先歇着，B继续跑
      		Gosched会在不同的goroutine之间切换，当main goroutine退出时，其他的goroutine都会直接退出。
    一个逻辑处理器处理goroutine时间较长
    		给予调度器的内部算法，一个正运行的goroutine在工作结束前，可以被停止并重新调度。
    		调度器这样做的目的是防止某个goroutine长时间占用逻辑处理器。当goroutine占用时间过长时，调度器会停止当前正运行的goroutine，并给其他可运行的goroutine运行的机会。
      		
```