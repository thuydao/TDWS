//
//  NSError+XPMessage.h
//  X-POS2
//
//  Created by Bun Le Viet on 6/28/16.
//  Copyright © 2016 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (XPMessage)

- (NSDictionary *)xp_responseData;

- (NSString *)xp_responseData_type;
- (NSString *)xp_responseData_message;

@end
