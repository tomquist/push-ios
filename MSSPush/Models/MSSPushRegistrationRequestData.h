//
//  MSSPushBackEndRegistrationRequestData.h
//  MSSPush
//
//  Created by Rob Szumlakowski on 2014-01-21.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSSPushRegistrationData.h"

@interface MSSPushRegistrationRequestData : MSSPushRegistrationData

@property NSString *secret;

@end