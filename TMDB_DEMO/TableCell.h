//
//  TableCell.h
//  TMDB_DEMO
//
//  Created by developer on 29/08/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;




@end
