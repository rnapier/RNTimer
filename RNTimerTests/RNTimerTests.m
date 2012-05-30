//
//  RNTimerTests.m
//  RNTimerTests
//
//  Created by Rob Napier on 05/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RNTimerTests.h"
#import "RNTimer.h"

@implementation RNTimerTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSimple
{
  RNTimer *timer = [RNTimer repeatingTimerWithTimeInterval:1 block:^{}];
  STAssertNotNil(timer, @"Timer must not be nil");
}

- (void)testDoesFire
{
  __block BOOL didFire = NO;
  RNTimer *timer = [RNTimer repeatingTimerWithTimeInterval:1 block:^{
    didFire = YES;
  }];

  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
  STAssertTrue(didFire, @"Didn't fire:%@", timer);
}

- (void)testDoesntFireToSoon
{
  __block BOOL didFire = NO;
  RNTimer *timer = [RNTimer repeatingTimerWithTimeInterval:1 block:^{
    didFire = YES;
  }];

  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.5]];
  STAssertFalse(didFire, @"Did fire:%@", timer);
}

- (void)testManualFire
{
  __block NSUInteger countOfFires = 0;

  RNTimer *timer = [RNTimer repeatingTimerWithTimeInterval:1 block:^{
    countOfFires++;
  }];
  [timer fire];

  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
  STAssertTrue(countOfFires == 2, @"Should have fired twice:%d", countOfFires);
}

@end
