//
//  NSError+XPMessage.m
//  X-POS2
//
//  Created by Bun Le Viet on 6/28/16.
//  Copyright © 2016 SmartOSC. All rights reserved.
//

#import "NSError+XPMessage.h"

@implementation NSError (XPMessage)

- (NSDictionary *)xp_responseData
{
    NSDictionary *dictData = self.userInfo;
    
    NSString *keyData = @"";
    for ( NSString *key in dictData.allKeys )
    {
        if ( [key hasSuffix:@".data"] )
        {
            keyData = [key copy];
            break;
        }
    }
    
    NSData *data = [dictData objectForKey:keyData];
    if ( !data || ![data isKindOfClass:[NSData class]] )
    {
        return [NSDictionary new];
    }
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if ( !json )
    {
        return [NSDictionary new];
    }
    
    return json;
}

- (NSString *)xp_responseData_type
{
    NSDictionary *dictData = [self xp_responseData];
    
    NSString *type = [dictData objectForKey:@"error"];
    
    return type;
}

- (NSString *)xp_responseData_message
{
    NSDictionary *dictData = [self xp_responseData];
    
    NSString *message = [dictData objectForKey:@"message"];
    
    if ( [message initWithString:@""] )
    {
        message = self.localizedDescription;
    }
    
    return message;
}

@end
