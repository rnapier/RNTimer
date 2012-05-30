RNTimer
=======

Simple GCD-based timer based on NSTimer. It starts immediately and stops when released. 
This avoids many of the typical problems with NSTimer:

* RNTimer runs in all modes (unlike NSTimer)
* RNTimer runs when there is no runloop (unlike NSTimer)
* Repeating RNTimers can easily avoid retain loops (unlike NSTimer)

Currently there is only a simple repeating timer (since this is the most common use that's 
hard to do correctly with NSTimer). It always runs on the main queue.

USAGE
=====
    __weak id weakSelf = self;
    self.timer =
        [RNTimer repeatingTimerWithTimeInterval:1
                                          block:^{
                                            [weakSelf doSomething];
                                          }];

BACKGROUND
==========
http://robnapier.net/blog/simple-gcd-timer-rntimer-762