//
//  NSData+HexToByte.m
//  mPOS
//
//  Created by 德益富 on 15/5/13.
//  Copyright (c) 2015年 Dyf. All rights reserved.
//

#import "NSData+HexToByte.h"
#include <openssl/opensslv.h>
#include <openssl/rsa.h>
#include <openssl/evp.h>
#include <openssl/bn.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

@implementation NSData (HexToByte)

+(NSData*) decryptIPKC:(NSString*)ipkc modulus:(NSString*)mod exponent:(NSString*)exp :(NSString *)d{
    NSString * hexString = ipkc;
    int hexStringLength= [hexString length] / 2;
    //unsigned char enc_bin[144];
    unsigned char dec_bin[hexStringLength];
    //int enc_len;
    int dec_len;
    RSA * rsa_pub = RSA_new();
    
    const char *N=[mod UTF8String] ;
    const char *E=[exp UTF8String];
    
    const char *D=[d UTF8String];
    
    char * myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    if (!BN_hex2bn(&rsa_pub->n, N)) {
        printf("NO CARGO EL MODULO");
    }
    if (!BN_hex2bn(&rsa_pub->e, E)) {
        printf("NO CARGO EL EXPONENTE");
    }
    if (!BN_hex2bn(&rsa_pub->d, D)) {
        printf("NO CARGO EL EXPONENTE");
    }
    if ((dec_len = RSA_private_encrypt(hexStringLength, (unsigned char*)myBuffer, dec_bin, rsa_pub,RSA_NO_PADDING))<0) {
//        printf("NO\n ");
    }
    NSData* data = [NSData dataWithBytes:dec_bin length:sizeof(dec_bin)];
    free(myBuffer);
    return data;
}


+(NSData*) encryptIPKC:(NSString*)ipkc modulus:(NSString*)mod exponent:(NSString*)exp{
    NSString * hexString = ipkc;
    int hexStringLength= [hexString length] / 2;
    //unsigned char enc_bin[144];
    unsigned char dec_bin[hexStringLength];
    //int enc_len;
    int dec_len;
    RSA * rsa_pub = RSA_new();
    
    const char *N=[mod UTF8String];
    const char *E=[exp UTF8String];
    char * myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    if (!BN_hex2bn(&rsa_pub->n, N)) {
        printf("NO CARGO EL MODULO");
    }
    if (!BN_hex2bn(&rsa_pub->e, E)) {
        printf("NO CARGO EL EXPONENTE");
    }
    if ((dec_len = RSA_public_encrypt(hexStringLength, (unsigned char*)myBuffer, dec_bin, rsa_pub,RSA_NO_PADDING))<0) {
        printf("NO\n ");
    }
    NSData* data = [NSData dataWithBytes:dec_bin length:sizeof(dec_bin)];
    free(myBuffer);
    return data;
}

@end
