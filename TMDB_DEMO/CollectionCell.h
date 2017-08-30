//
//  CollectionCell.h
//  TMDB_DEMO
//
//  Created by developer on 29/08/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UIImageView *movieimage;

@end
