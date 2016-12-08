//
//  NSDictionary+TDJSON.m
//  Pods
//
//  Created by tutitutituti on 12/8/16.
//
//

#import "NSDictionary+TDJSON.h"
#import <AFNetworking/AFNetworking.h>

@implementation NSDictionary (TDJSON)

+ (NSString *)toJSON
{
    return AFQueryStringFromParameters(self);
}

@end
