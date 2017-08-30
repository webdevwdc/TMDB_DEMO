
#import "ServiceRequestHandler.h"


@implementation ServiceRequestHandler

static ServiceRequestHandler *sharedRequestHandler = nil;

+(ServiceRequestHandler *)sharedRequestHandler {
    @synchronized (self) {
        if (sharedRequestHandler == nil) {
            sharedRequestHandler = [[self alloc] init];
        }
    }
    
    return sharedRequestHandler;
}


-(id)init {
    if (self = [super init]) {
        
    }
    return self;
}


-(void)getServiceData:(NSMutableDictionary*)param geturl:(NSString*)url getServiceDataCallBack:(void (^)(NSInteger status, NSObject *data))callBack {
    
    [SVProgressHUD showWithStatus:@"loading" maskType:SVProgressHUDMaskTypeClear];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         [SVProgressHUD dismiss];
         NSLog(@"%@",responseObject);
         NSDictionary *response = (NSDictionary *)responseObject;
         int statusCode = [[[response valueForKey:@"result"]valueForKey:@"error"] intValue];
         
         callBack (statusCode,response);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [SVProgressHUD dismiss];
              NSString *strFailure = [error localizedDescription];
              NSLog(@"%@",strFailure);
              if([strFailure isEqualToString:@"Could not connect to the server."])
              {
             
                  callBack(2, @"Could not connect to the server.");
                  
              }
              else{
                  
                  callBack(2, strFailure);
              }
          }];

}

@end
