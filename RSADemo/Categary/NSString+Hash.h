//
//  NSString+Hash.h
//
//  Created by Tom Corwine on 5/30/12..
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Hash)

+(NSString*)encryptRSA:(NSString*)hexString;
+(NSString*)decryptRSA:(NSString*)hexString;

@end
