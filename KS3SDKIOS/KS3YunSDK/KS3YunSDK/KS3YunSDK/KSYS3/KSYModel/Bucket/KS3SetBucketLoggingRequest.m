//
//  KSS3SetBucketLoggingRequest.m
//  KS3SDK
//
//  Created by JackWong on 12/14/14.
//  Copyright (c) 2014 kingsoft. All rights reserved.
//

#import "KS3SetBucketLoggingRequest.h"
#import "KS3Constants.h"

@implementation KS3SetBucketLoggingRequest
- (instancetype)initWithName:(NSString *)bucketName
{
    self = [super init];
    if (self) {
        self.bucket = bucketName;
        self.httpMethod = kHttpMethodPut;
        self.contentMd5 = @"";
        self.contentType = @"";
        self.kSYHeader = @"";
        self.kSYResource =  [NSString stringWithFormat:@"/%@/?logging", bucketName];
        self.host = [NSString stringWithFormat:@"http://%@.kss.ksyun.com/?logging", bucketName];
    }
    return self;
}
- (KS3URLRequest *)configureURLRequest
{
    NSString *strBody = @"<BucketLoggingStatus xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\" />";
    [self.urlRequest setHTTPBody:[strBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    [super configureURLRequest];
    return self.urlRequest;
}
@end