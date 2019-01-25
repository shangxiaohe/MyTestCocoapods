//
//  TwelveViewController.m
//  TwoTest
//
//  Created by ren on 2017/9/21.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "TwelveViewController.h"
#import "sqlite3.h"
//#import "FMDatabase.h"
//#import "FMDatabaseQueue.h"

@interface TwelveViewController ()
{
    NSString *hexStr;
}
//@property(nonatomic,weak)FMDatabaseQueue *queue;
@end

@implementation TwelveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"1406400822.db"];
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSError *error;
//    NSString *filenameAgo = [bundle pathForResource:@"1406400822" ofType:@"db"];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    [fileManager copyItemAtPath:filenameAgo toPath:filename error:&error];
//
//    __block Byte *by;
//
//
//    self.queue = [FMDatabaseQueue databaseQueueWithPath:filename];
//    [self.queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *rs = [db executeQuery:@"select * from mr_friend_E703CC01CEB312173668696B23C4B694_New"];
//
//        while (rs.next) {
//            NSData *data = [rs dataForColumn:@"msgData"];
//            NSLog(@"%@",data);
//
//            by = (Byte *)[data bytes];
//
//            hexStr=@"";
//            for(int i = 0; i< data.length ; i++)
//            {
//                NSString *newHexStr = [NSString stringWithFormat:@"%x",by[i]&0xff];///16进制数
//
//                if([newHexStr length]==1)
//
//                    hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
//
//                else
//
//                    hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
//            }
//            NSLog(@"hex = %@",hexStr);
//
//
//            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"---%@---",str);
//            return;
//        }
//    }];
//
//
//
//    [self aaa:hexStr];
//
}

-(void)aaa:(NSString *)str
{
//    char ch[100];
//    memcpy(ch, [str cStringUsingEncoding:NSASCIIStringEncoding], 2*(str.length));
    
    
    
    char a='2';
    char b = '1';
    char c = a^b;
    
    NSLog(@"c == %c",c);
    
    NSString *str1 = @"经理？";
    
    NSString *str2 = [str1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *str3 = [@"%E7%BB%8F%E7%90%86%EF%BC" stringByRemovingPercentEncoding];
    NSLog(@"str1 == %@, str2 == %@",str2,str3);
    
    
    [self stringFromHexString:@"d1b493dc"];
    [self convertStringToHexStr:@"经理"];
    [self convertHexStrToString:@"d1b493dc"];
}




- (NSString *)stringFromHexString:(NSString *)hexString {  // eg. hexString = @"8c376b4c"
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:NSUnicodeStringEncoding];
    //    printf("%s\n", myBuffer);
    free(myBuffer);
    
    NSString *temp1 = [unicodeString stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *temp2 = [temp1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *temp3 = [[@"\"" stringByAppendingString:temp2] stringByAppendingString:@"\""];
    NSData *tempData = [temp3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *temp4 = [NSPropertyListSerialization propertyListFromData:tempData
                                                       mutabilityOption:NSPropertyListImmutable
                                                                 format:NULL
                                                       errorDescription:NULL];
    NSString *string = [temp4 stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
    
    NSLog(@"-------string----%@", string); //输出 谷歌
    return string;
}


- (NSString *)convertStringToHexStr:(NSString *)str {
    if (!str || [str length] == 0) {
        return @"";
    }
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

- (NSString *)convertHexStrToString:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    NSString *string = [[NSString alloc]initWithData:hexData encoding:NSUTF8StringEncoding];
    return string;
}


@end
