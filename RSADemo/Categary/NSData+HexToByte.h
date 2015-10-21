//
//  NSData+HexToByte.h
//  mPOS
//
//  Created by 德益富 on 15/5/13.
//  Copyright (c) 2015年 Dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HexToByte)
+(NSData*) decryptIPKC:(NSString*)ipkc modulus:(NSString*)mod exponent:(NSString*)exp :(NSString *)d;

+(NSData*) encryptIPKC:(NSString*)ipkc modulus:(NSString*)mod exponent:(NSString*)exp;
@end
