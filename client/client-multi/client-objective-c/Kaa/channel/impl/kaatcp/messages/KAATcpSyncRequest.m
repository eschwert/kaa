/*
 *  Copyright 2014-2016 CyberVision, Inc.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#import "KAATcpSyncRequest.h"

@implementation KAATcpSyncRequest

- (instancetype)initWithAvro:(NSData *)avroObject zipped:(BOOL)isZipped encypted:(BOOL)isEncrypted {
    return [self initWithAvro:avroObject request:YES zipped:isZipped encypted:isEncrypted];
}

- (instancetype)initWithOldKaaSync:(KAATcpKaaSync *)old {
    self = [super initWithOldKaaSync:old];
    if (self) {
        [self setRequest:YES];
        NSInputStream *input = [self remainingStream];
        [input open];
        [self decodeAvroObjectFromInput:input];
        [input close];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setRequest:YES];
    }
    return self;
}

@end
