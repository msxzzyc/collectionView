//
//  ViewController.m
//  collectionView
//
//  Created by wpzyc on 2017/7/31.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCLineLayout.h"
#import "ZYCPhotoCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController
static NSString *const ZYCPhotoCellId = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建布局
    ZYCLineLayout *layout = [[ZYCLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    
    //创建collectionView 必须在创建时传layout
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate =self;
    [self.view addSubview:collectionView];
    //注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ZYCPhotoCellId];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZYCPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYCPhotoCellId forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor orangeColor];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item+1];
    return cell;
}
#pragma mark - <UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
