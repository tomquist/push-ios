//
//  Copyright (C) 2014 Pivotal Software, Inc. All rights reserved.
//

#import "Kiwi.h"

#import "PCFPushPersistentStorage.h"
#import "PCFPushSpecsHelper.h"

SPEC_BEGIN(PCFPushPersistentStorageSpec)

describe(@"PCFPushPersistentStorage", ^{

    __block PCFPushSpecsHelper *helper;

    beforeEach(^{
        helper = [[PCFPushSpecsHelper alloc] init];
        [PCFPushPersistentStorage reset];
    });
    
    afterAll(^{
        [PCFPushPersistentStorage reset];
    });
                   
    it(@"should start empty", ^{
        [[[PCFPushPersistentStorage APNSDeviceToken] should] beNil];
        [[[PCFPushPersistentStorage serverDeviceID] should] beNil];
        [[[PCFPushPersistentStorage variantUUID] should] beNil];
        [[[PCFPushPersistentStorage variantSecret] should] beNil];
        [[[PCFPushPersistentStorage deviceAlias] should] beNil];
        [[[PCFPushPersistentStorage tags] should] beNil];
        [[[PCFPushPersistentStorage serverVersion] should] beNil];
        [[[PCFPushPersistentStorage serverVersionTimePolled] should] beNil];
        [[[PCFPushPersistentStorage customUserId] should] beNil];
        [[[PCFPushPersistentStorage pushApiUrl] should] beNil];
        [[[PCFPushPersistentStorage developmentPushPlatformUuid] should] beNil];
        [[[PCFPushPersistentStorage developmentPushPlatformSecret] should] beNil];
        [[[PCFPushPersistentStorage productionPushPlatformUuid] should] beNil];
        [[[PCFPushPersistentStorage productionPushPlatformSecret] should] beNil];
        
        [[theValue([PCFPushPersistentStorage lastGeofencesModifiedTime]) should] equal:theValue(PCF_NEVER_UPDATED_GEOFENCES)];
        [[theValue([PCFPushPersistentStorage areGeofencesEnabled]) should] beNo];
    });
    
    it(@"should be able to save the APNS device token", ^{
        [PCFPushPersistentStorage setAPNSDeviceToken:helper.apnsDeviceToken];
        [[[PCFPushPersistentStorage APNSDeviceToken] should] equal:helper.apnsDeviceToken];
    });
    
    it(@"should be able to save the back-end device ID", ^{
        [PCFPushPersistentStorage setServerDeviceID:helper.backEndDeviceId];
        [[[PCFPushPersistentStorage serverDeviceID] should] equal:helper.backEndDeviceId];
    });
    
    it(@"should be able to save the variant UUID", ^{
        [PCFPushPersistentStorage setVariantUUID:TEST_VARIANT_UUID_1];
        [[[PCFPushPersistentStorage variantUUID] should] equal:TEST_VARIANT_UUID_1];
    });
    
    it(@"should be able to save the variant secret", ^{
        [PCFPushPersistentStorage setVariantSecret:TEST_VARIANT_SECRET_1];
        [[[PCFPushPersistentStorage variantSecret] should] equal:(TEST_VARIANT_SECRET_1)];
    });
    
    it(@"should be able to save the custom user ID", ^{
        [PCFPushPersistentStorage setCustomUserId:TEST_CUSTOM_USER_ID];
        [[[PCFPushPersistentStorage customUserId] should] equal:TEST_CUSTOM_USER_ID];
    });

    it(@"should be able to save the device alias", ^{
        [PCFPushPersistentStorage setDeviceAlias:TEST_DEVICE_ALIAS_1];
        [[[PCFPushPersistentStorage deviceAlias] should] equal:TEST_DEVICE_ALIAS_1];
    });
    
    it(@"should be able to save populated tags", ^{
        [PCFPushPersistentStorage setTags:helper.tags1];
        [[[PCFPushPersistentStorage tags] should] equal:helper.tags1];
    });
    
    it(@"should be able to save nil tags", ^{
        [PCFPushPersistentStorage setTags:nil];
        [[[PCFPushPersistentStorage tags] should] beNil];
    });

    it(@"should be able to save last modified times", ^{
        [PCFPushPersistentStorage setGeofenceLastModifiedTime:7777L];
        [[theValue([PCFPushPersistentStorage lastGeofencesModifiedTime]) should] equal:theValue(7777L)];
    });

    it(@"should be able to save are geofences enabled", ^{
        [PCFPushPersistentStorage setAreGeofencesEnabled:YES];
        [[theValue([PCFPushPersistentStorage areGeofencesEnabled]) should] beYes];
    });

    it(@"should be able to save the server version", ^{
        [PCFPushPersistentStorage setServerVersion:@"1.3.3.7"];
        [[[PCFPushPersistentStorage serverVersion] should] equal:@"1.3.3.7"];
    });

    it(@"should be able to save the server version time polled", ^{
        NSDate *testDate = [NSDate date];
        [PCFPushPersistentStorage setServerVersionTimePolled:testDate];
        [[[PCFPushPersistentStorage serverVersionTimePolled] should] equal:testDate];
    });
    
    it(@"should save the push api url", ^{
        [PCFPushPersistentStorage setPushApiUrl:@"testurl"];
        [[[PCFPushPersistentStorage pushApiUrl] should] equal:@"testurl"];
    });
    
    it(@"should save the push dev variant uuid", ^{
        [PCFPushPersistentStorage setDevelopmentPushPlatformUuid:@"testuuid"];
        [[[PCFPushPersistentStorage developmentPushPlatformUuid] should] equal:@"testuuid"];
    });
    
    it(@"should save the push dev variant secret", ^{
        [PCFPushPersistentStorage setDevelopmentPushPlatformSecret:@"testsecret"];
        [[[PCFPushPersistentStorage developmentPushPlatformSecret] should] equal:@"testsecret"];
    });
    
    it(@"should save the push prod variant uuid", ^{
        [PCFPushPersistentStorage setProductionPushPlatformUuid:@"testuuid"];
        [[[PCFPushPersistentStorage productionPushPlatformUuid] should] equal:@"testuuid"];
    });
    
    it(@"should save the push prod variant secret", ^{
        [PCFPushPersistentStorage setProductionPushPlatformSecret:@"testsecret"];
        [[[PCFPushPersistentStorage productionPushPlatformSecret] should] equal:@"testsecret"];
    });
    
    it(@"should clear values after being reset", ^{
        [PCFPushPersistentStorage setAPNSDeviceToken:helper.apnsDeviceToken];
        [PCFPushPersistentStorage setServerDeviceID:helper.backEndDeviceId];
        [PCFPushPersistentStorage setCustomUserId:TEST_CUSTOM_USER_ID];
        [PCFPushPersistentStorage setDeviceAlias:TEST_DEVICE_ALIAS_1];
        [PCFPushPersistentStorage setVariantUUID:TEST_VARIANT_UUID_1];
        [PCFPushPersistentStorage setVariantSecret:TEST_VARIANT_SECRET_1];
        [PCFPushPersistentStorage setTags:helper.tags2];
        [PCFPushPersistentStorage setGeofenceLastModifiedTime:888L];
        [PCFPushPersistentStorage setAreGeofencesEnabled:YES];
        [PCFPushPersistentStorage setServerVersion:@"3.4.5.6"];
        [PCFPushPersistentStorage setServerVersionTimePolled:[NSDate date]];
        [PCFPushPersistentStorage setPushApiUrl:@"someurl"];
        [PCFPushPersistentStorage setProductionPushPlatformUuid:@"someuuid"];
        [PCFPushPersistentStorage setProductionPushPlatformSecret:@"somesecret"];
        [PCFPushPersistentStorage setDevelopmentPushPlatformUuid:@"someuuid"];
        [PCFPushPersistentStorage setDevelopmentPushPlatformSecret:@"somesecret"];
        
        [PCFPushPersistentStorage reset];
        [[[PCFPushPersistentStorage APNSDeviceToken] should] beNil];
        [[[PCFPushPersistentStorage serverDeviceID] should] beNil];
        [[[PCFPushPersistentStorage customUserId] should] beNil];
        [[[PCFPushPersistentStorage deviceAlias] should] beNil];
        [[[PCFPushPersistentStorage variantUUID] should] beNil];
        [[[PCFPushPersistentStorage variantSecret] should] beNil];
        [[[PCFPushPersistentStorage tags] should] beNil];
        [[theValue([PCFPushPersistentStorage lastGeofencesModifiedTime]) should] equal:theValue(PCF_NEVER_UPDATED_GEOFENCES)];
        [[theValue([PCFPushPersistentStorage areGeofencesEnabled]) should] beNo];
        [[[PCFPushPersistentStorage serverVersion] should] beNil];
        [[[PCFPushPersistentStorage serverVersionTimePolled] should] beNil];
        [[[PCFPushPersistentStorage pushApiUrl] should] beNil];
        [[[PCFPushPersistentStorage developmentPushPlatformUuid] should] beNil];
        [[[PCFPushPersistentStorage developmentPushPlatformSecret] should] beNil];
        [[[PCFPushPersistentStorage productionPushPlatformUuid] should] beNil];
        [[[PCFPushPersistentStorage productionPushPlatformSecret] should] beNil];
        
    });
});

SPEC_END
