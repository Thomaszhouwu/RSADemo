//
//  NSString+Hash.m
//
//  Created by Tom Corwine on 5/30/12.
//

#import "NSString+hash.h"
#import "NSData+HexToByte.h"

#include <stdlib.h>

//------------key-------------------//
#define  PublicKey  @"19EDB7EEFF80165DB721620027E1879D19ACA26B658C721D4C23DF129DAB482DD2C9FB1A313660C8C5B2E19C0346807FEEF8B370B66EF5962F0CA052C9598B7326653C3C62282F41FB04817330A0023F37A7B6D030BC67D2CAEBA5EADBFADFA2D5132EF7B81C816AAC60C93AD24604D7A445490495688B6B19C3065FDB3FB7E1"

#define  PrivateKey  @"5C2F39BC12B3BEA4743E9D75F52732C9509CDEDA65AD6451F52E653D5F1D2E4C335674A87FB5857F7174BE0E31BF41BD326BF91B559FD8EA9F0800638A60775440D27765EBEE1D56544C2CB4F30A24DC3262523A75C5D8B86E70C723E09FB5A75AE0C1A67FA72DD80900BF41EFD035AD4D2A44F59C3E2F813A097F6E79610C71"

#define PrivateKey2  @"9813AF225D531D0C53DDCE9B9A43D3C82CFB64DBCD12E285526B0990625B4025213B2445BAE90D36E78336E76B909E6C6C468E365A05F4807BD19E5CB65B827CB7EAB3B21D2FA1704ADBCDD6EF246D237021E132346A7BA98C13DC3CC479697BCF4469B6FD9E7282D29FFF40AF072714F13E410AA7DB56F54AA2F40AEEAB9787"

@implementation NSString (Hash)

+(NSString*)encryptRSA:(NSString*)hexString//加密的数据
{
    NSString *m= PublicKey;
    NSString *e=@"10001";
    NSData *decryptedIPKC= [NSData encryptIPKC:hexString modulus:m exponent:e];
    NSString *postToken=decryptedIPKC.description;
    NSRange range=NSMakeRange(1, postToken.length-2);
    postToken=[[postToken substringWithRange:range] stringByReplacingOccurrencesOfString:@" " withString:@""];
    return postToken;
}


+(NSString*)decryptRSA:(NSString*)hexString
{
    NSString *e=@"10001";
    NSString *d=PrivateKey;
    NSString *n=PrivateKey2;
    NSData *decryptedIPKC= [NSData decryptIPKC:hexString modulus:n exponent:e :d];
    NSString *postToken=decryptedIPKC.description;
    NSRange range=NSMakeRange(1, postToken.length-2);
    postToken=[[postToken substringWithRange:range] stringByReplacingOccurrencesOfString:@" " withString:@""];
    return postToken;
}


@end
