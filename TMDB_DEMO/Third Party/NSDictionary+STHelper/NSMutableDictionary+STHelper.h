


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (STHelper)

- (void)st_setBool:(BOOL)value forKey:(NSString *)key;
- (void)st_setInteger:(NSInteger)value forKey:(NSString *)key;
- (void)st_setUnsignedInteger:(NSUInteger)value forKey:(NSString *)key;
- (void)st_setChar:(char)value forKey:(NSString *)key;
- (void)st_setUnsignedChar:(unsigned char)value forKey:(NSString *)key;
- (void)st_setShort:(short)value forKey:(NSString *)key;
- (void)st_setUnsignedShort:(unsigned short)value forKey:(NSString *)key;
- (void)st_setLong:(long)value forKey:(NSString *)key;
- (void)st_setUnsignedLong:(unsigned long)value forKey:(NSString *)key;
- (void)st_setLongLong:(long long)value forKey:(NSString *)key;
- (void)st_setUnsignedLongLong:(unsigned long long)value forKey:(NSString *)key;
- (void)st_setInt8:(int8_t)value forKey:(NSString *)key;
- (void)st_setUInt8:(uint8_t)value forKey:(NSString *)key;
- (void)st_setInt16:(int16_t)value forKey:(NSString *)key;
- (void)st_setUInt16:(uint16_t)value forKey:(NSString *)key;
- (void)st_setInt32:(int32_t)value forKey:(NSString *)key;
- (void)st_setUInt32:(uint32_t)value forKey:(NSString *)key;
- (void)st_setInt64:(int64_t)value forKey:(NSString *)key;
- (void)st_setUInt64:(uint64_t)value forKey:(NSString *)key;
- (void)st_setFloat:(float)value forKey:(NSString *)key;
- (void)st_setDouble:(double)value forKey:(NSString *)key;
- (void)st_setTimeInterval:(NSTimeInterval)value forKey:(NSString *)key;
- (void)st_setCGPoint:(CGPoint)value forKey:(NSString *)key;
- (void)st_setCGRect:(CGRect)value forKey:(NSString *)key;
- (void)st_setCGSize:(CGSize)value forKey:(NSString *)key;
- (void)st_setCGAffineTransform:(CGAffineTransform)value forKey:(NSString *)key;
- (void)st_setUIEdgeInsets:(UIEdgeInsets)value forKey:(NSString *)key;
- (void)st_setUIOffset:(UIOffset)value forKey:(NSString *)key;

@end
