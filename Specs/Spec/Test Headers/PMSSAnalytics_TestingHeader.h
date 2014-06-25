//
//  PMSSAnalytics_TestingHeader.h
//  PMSSPushSpec
//
//  Created by DX123-XL on 2014-04-03.
//
//

#import "PMSSAnalytics.h"

@interface PMSSAnalytics (TestingHeader)

+ (BOOL)shouldSendAnalytics;

+ (NSUInteger)maxStoredEventCount;
+ (void)setMaxStoredEventCount:(NSUInteger)maxCount;

+ (NSUInteger)maxBatchSize;
+ (void)setMaxBatchSize:(NSUInteger)batchSize;

+ (NSTimeInterval)minSecondsBetweenSends;
+ (void)setMinSecondsBetweenSends:(NSTimeInterval)minSeconds;

+ (NSTimeInterval)lastSendTime;
+ (void)setLastSendTime:(NSTimeInterval)sendTime;

+ (void)insertIntoContext:(NSManagedObjectContext *)context
            eventWithType:(NSString *)eventType
                     data:(NSDictionary *)eventData;

@end