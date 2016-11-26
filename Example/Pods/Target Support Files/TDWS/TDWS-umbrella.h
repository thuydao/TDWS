#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AFAppDotNetAPIClient.h"
#import "NSError+XPMessage.h"
#import "TDService.h"
#import "TDWS.h"

FOUNDATION_EXPORT double TDWSVersionNumber;
FOUNDATION_EXPORT const unsigned char TDWSVersionString[];

