
#import <Foundation/Foundation.h>

@interface ServiceRequestHandler : NSObject

+(ServiceRequestHandler *)sharedRequestHandler;

-(void)getServiceData:(NSMutableDictionary*)param geturl:(NSString*)url getServiceDataCallBack:(void (^)(NSInteger status, NSObject *data))callBack;

@end
