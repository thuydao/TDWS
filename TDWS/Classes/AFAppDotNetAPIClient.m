// AFAppDotNetAPIClient.h
//
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"

@implementation AFAppDotNetAPIClient

static AFAppDotNetAPIClient *_sharedClient = nil;

+ (instancetype)sharedClient
{

    if (!_sharedClient) {
        [self setupBaseUrl:[NSURL URLWithString:@""]];
    }

    return _sharedClient;
}

+ (void)setupBaseUrl:(NSURL *)url
{
    _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:url];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    _sharedClient.securityPolicy = securityPolicy;

    _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/xml", @"application/json", @"application/x-www-form-urlencoded", @"charset=UTF-8", nil];
}


+ (void)useJSONRequestSerializer  {
    [[AFAppDotNetAPIClient sharedClient] useJSONRequestSerializer];

}

+ (void)useHTTPRequestSerializer {
    [[AFAppDotNetAPIClient sharedClient] useHTTPRequestSerializer];
    
}

+ (void)authorizationUsr:(NSString *)usr pwd:(NSString *)pwd
{
    [self authorizationUsr:usr pwd:pwd];
}


- (instancetype)initJSONRequestSerializerWithBaseUrl:(NSURL *)url
{
    if (self = [super init]) {
        self = [[AFAppDotNetAPIClient alloc] initWithBaseURL:url];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        self.securityPolicy = securityPolicy;
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/xml", @"application/json", @"application/x-www-form-urlencoded", @"charset=UTF-8", nil];
        [self useJSONRequestSerializer];
    }
    
    return self;
}

- (instancetype)initHTTPRequestSerializerWithBaseUrl:(NSURL *)url
{
    if (self = [super init]) {
        self = [[AFAppDotNetAPIClient alloc] initWithBaseURL:url];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        self.securityPolicy = securityPolicy;
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/xml", @"application/json", @"application/x-www-form-urlencoded", @"charset=UTF-8", nil];
        [self useHTTPRequestSerializer];
    }
    
    return self;
}

- (void)useJSONRequestSerializer {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
}

- (void)useHTTPRequestSerializer {
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
}

- (void)authorizationUsr:(NSString *)usr pwd:(NSString *)pwd
{
    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:usr password:pwd];
}

@end
