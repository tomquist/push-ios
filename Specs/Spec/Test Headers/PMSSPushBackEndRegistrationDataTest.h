//
//  PMSSPushBackEndRegistrationDataTest.h
//  PMSSPushSDK
//
//  Created by DX123-XL on 3/11/2014.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "PMSSPushRegistrationData.h"

OBJC_EXTERN const struct RegistrationAttributes {
    PMSS_STRUCT_STRING *variantUUID;
    PMSS_STRUCT_STRING *deviceAlias;
    PMSS_STRUCT_STRING *deviceManufacturer;
    PMSS_STRUCT_STRING *deviceModel;
    PMSS_STRUCT_STRING *deviceOS;
    PMSS_STRUCT_STRING *deviceOSVersion;
    PMSS_STRUCT_STRING *registrationToken;
} RegistrationAttributes;

static NSString *const TEST_VARIANT_UUID        = @"123-456-789";
static NSString *const TEST_SECRET              = @"My cat's breath smells like cat food";
static NSString *const TEST_DEVICE_ALIAS        = @"l33t devices of badness";
static NSString *const TEST_DEVICE_MANUFACTURER = @"Commodore";
static NSString *const TEST_DEVICE_MODEL        = @"64C";
static NSString *const TEST_OS                  = @"BASIC";
static NSString *const TEST_OS_VERSION          = @"2.0";
static NSString *const TEST_REGISTRATION_TOKEN  = @"ABC-DEF-GHI";
static NSString *const TEST_DEVICE_UUID         = @"L337-L337-OH-YEAH";

@interface PMSSPushRegistrationData (TestingHeader)

@end