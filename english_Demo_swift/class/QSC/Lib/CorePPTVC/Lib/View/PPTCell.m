//
//  PPTCell.m
//  CorePPTCVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "PPTCell.h"
#import "UIImageView+SD.h"
#import "UIImageView+WebCache.h"

static NSString *const rid= @"PPTCell";


@interface PPTCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end





@implementation PPTCell

- (void)awakeFromNib {
    
    
}




/**
 *  为cell所属collectionView注册cell（从Nib注册）
 *
 *  @param clv collectionView
 */
+(void)registerWithNibForCollectionView:(UICollectionView *)clv{
    
    [clv registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellWithReuseIdentifier:rid];
}





/**
 *  取出cell
 *
 *  @param clv       collectionView
 *  @param indexPath indexPath
 *
 *  @return cell
 */
+(instancetype)dequeueReusableCellForCollectionView:(UICollectionView *)clv indexPath:(NSIndexPath *)indexPath{
    
    PPTCell *cell = [clv dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}




-(void)setPptModel:(PPTModel *)pptModel{
    
    _pptModel = pptModel;
    
    //数据填充
    [self dataFill];
}
/*
 *  数据填充
 */
-(void)dataFill{
    
    if(_pptModel.imageURLString == nil){
        _imageV.image = _pptModel.image;
    }else{
        [_imageV sd_setImageWithURL:[NSURL URLWithString:_pptModel.imageURLString] placeholderImage:nil options:SDWebImageCacheMemoryOnly|SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
            CATransition *transition = [CATransition animation];
            transition.type = kCATransitionFade;
            [transition setDuration:0.25];
            [_imageV.layer addAnimation:transition forKey:nil];
            [_imageV.superview addSubview:_imageV];
        }];
    }
}

@end
