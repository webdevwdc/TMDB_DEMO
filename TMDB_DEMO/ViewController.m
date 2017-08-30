//
//  ViewController.m
//  TMDB_DEMO
//
//  Created by developer on 29/08/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "ViewController.h"
#import "TableCell.h"
#import "CollectionCell.h"

#define IMAGE_URL @"http://image.tmdb.org/t/p/w780/"

@interface ViewController (){

    __weak IBOutlet UITableView *table;
    
        
    NSMutableArray *arrDateMovieList;      //// Use to hold array according to Date Range
    NSMutableArray *arrPopularMovieList;   //// Use to hold array according to popularity
    NSMutableArray *arrTopRatedMovieList;  //// use to hold array according to rating
    

}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrDateMovieList = [[NSMutableArray alloc] init];
    arrPopularMovieList = [[NSMutableArray alloc] init];
    arrTopRatedMovieList = [[NSMutableArray alloc] init];
    
    
    table.tableHeaderView = _sectionView;
    
    [self movieListFetchForDateLimit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
    {
        return 1;
    }
    else if (section==1)
    {
        return 1;
    }
    else
    {
        return 1;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    cell.collectionview.tag = indexPath.section;
    
    [cell.collectionview reloadData];
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40.0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    _sectionView = (HeaderView *)[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil][0];
    
    _sectionView.frame = CGRectMake(0, 0, self.view.frame.size.width,40);
    
    if (section == 0)
        _sectionView.lblHeaderName.text = @"New in Theatres";
    if (section == 1)
        _sectionView.lblHeaderName.text = @"Popular";
    if (section == 2)
        _sectionView.lblHeaderName.text = @"Highest Rated This Year";
    
    return _sectionView;

}

#pragma mark - CollectionView Delegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (collectionView.tag == 0) {
        return arrDateMovieList.count;
    }
    else if (collectionView.tag == 1) {
        return arrPopularMovieList.count;
    }
    else{
        return arrTopRatedMovieList.count;
    }
    
}
- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point

{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
    

    cell.movieimage.layer.masksToBounds =YES;
    cell.movieimage.layer.cornerRadius = 8;
    
    if (collectionView.tag == 0) {
        cell.movieName.text = [[arrDateMovieList objectAtIndex:indexPath.item] st_stringForKey:@"title"];
        
        if ([[arrDateMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]) {
            
            [self loadCellImage:cell.movieimage imageUrl:[NSString stringWithFormat:@"%@%@",IMAGE_URL,[[arrDateMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]]];

        }
        else{
            cell.movieimage.image = [UIImage imageNamed:@"No_Image"];
        }
        
        
    }
    else if (collectionView.tag == 1) {
        cell.movieName.text = [[arrPopularMovieList objectAtIndex:indexPath.item] st_stringForKey:@"title"];
        
        if ([[arrPopularMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]){
            
        [self loadCellImage:cell.movieimage imageUrl:[NSString stringWithFormat:@"%@%@",IMAGE_URL,[[arrPopularMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]]];
        }
        else{
            cell.movieimage.image = [UIImage imageNamed:@"No_Image"];
        }
        
    }
    else{
        cell.movieName.text = [[arrTopRatedMovieList objectAtIndex:indexPath.item] st_stringForKey:@"title"];
        
        if ([[arrTopRatedMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]){
           
            [self loadCellImage:cell.movieimage imageUrl:[NSString stringWithFormat:@"%@%@",IMAGE_URL,[[arrTopRatedMovieList objectAtIndex:indexPath.item] st_stringForKey:@"poster_path"]]];

        }
        else{
            cell.movieimage.image = [UIImage imageNamed:@"No_Image"];

        }
        
    }

    return cell;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark - Movie List Fetch According to Date Limit

-(void)movieListFetchForDateLimit{
    
    [[ServiceRequestHandler sharedRequestHandler] getServiceData:nil geturl:@"http://api.themoviedb.org/3/discover/movie?api_key=da86572d94091de3671c20ed449c4c70&language=en&page=1&primary_release_date.gte=2017-07-01&primary_release_date.lte=2017-08-28" getServiceDataCallBack:^(NSInteger status, NSObject *data)
     {

         arrDateMovieList =nil;
         if(status==0)
         {
             arrDateMovieList = [[(NSDictionary*)data st_arrayForKey:@"results"] mutableCopy];
             [self movieListFetchForPopularity];
             
          }
        else
         {
             NSString *str = (NSString *)data;
             [self showAlertWithMessage:str];
             
         }
     }];
}

#pragma mark - Movie List Fetch According to Popularity

-(void)movieListFetchForPopularity{
    
    [[ServiceRequestHandler sharedRequestHandler] getServiceData:nil geturl:@"http://api.themoviedb.org/3/discover/movie?api_key=da86572d94091de3671c20ed449c4c70&movie/popular" getServiceDataCallBack:^(NSInteger status, NSObject *data)
     {
         
         arrPopularMovieList =nil;
         if(status==0)
         {
             arrPopularMovieList = [[(NSDictionary*)data st_arrayForKey:@"results"] mutableCopy];
             [self movieListFetchForTopRated];
             
         }
         else
         {
             NSString *str = (NSString *)data;
             [self showAlertWithMessage:str];
             
         }
     }];
}


#pragma mark - Movie List Fetch According to TopRated

-(void)movieListFetchForTopRated{
    
    [[ServiceRequestHandler sharedRequestHandler] getServiceData:nil geturl:@"http://api.themoviedb.org/3/discover/movie?api_key=da86572d94091de3671c20ed449c4c70&language=en&page=1&vote_count.gte=500&year=2017" getServiceDataCallBack:^(NSInteger status, NSObject *data)
     {
         
         arrTopRatedMovieList =nil;
         if(status==0)
         {
             arrTopRatedMovieList = [[(NSDictionary*)data st_arrayForKey:@"results"] mutableCopy];
             [table reloadData];
             
         }
         else
         {
             NSString *str = (NSString *)data;
             [self showAlertWithMessage:str];
             
         }
     }];
}



#pragma mark - Showing Alert Method

-(void)showAlertWithMessage:(NSString *)strMsg{
    
     UIAlertController * alert=   [UIAlertController
     alertControllerWithTitle:@""
     message:strMsg
     preferredStyle:UIAlertControllerStyleAlert];
     
     UIAlertAction* ok = [UIAlertAction
     actionWithTitle:@"OK"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action)
     {
     [alert dismissViewControllerAnimated:YES completion:nil];
     
     }];
     
     [alert addAction:ok];
     
     [self presentViewController:alert animated:YES completion:nil];
}



#pragma mark - Load Image Asynchronously

- (void)loadCellImage:(UIImageView *)imageView imageUrl:(NSString *)imageURL
{
    if (imageURL) {
        [[imageView viewWithTag:99] removeFromSuperview];
        
        __block UIActivityIndicatorView *activityIndicator;
        __weak UIImageView *weakImageView = imageView;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL]
                     placeholderImage:nil
                              options:SDWebImageProgressiveDownload
                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                 if (!activityIndicator) {
                                     [weakImageView addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite]];
                                     activityIndicator.tag = 99;
                                     activityIndicator.center = weakImageView.center;
                                     [activityIndicator startAnimating];
                                 }
                             }
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                [activityIndicator removeFromSuperview];
                                activityIndicator = nil;
                            }];
    }
}


@end
