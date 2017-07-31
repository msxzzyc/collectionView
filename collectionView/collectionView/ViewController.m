//
//  ViewController.m
//  collectionView
//
//  Created by wpzyc on 2017/7/31.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCLineLayout.h"
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController
static NSString *const ZYCCellId = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建布局
    ZYCLineLayout *layout = [[ZYCLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    //水平滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //创建collectionView 必须在创建时传layout
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    //注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ZYCCellId];
}
#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYCCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}
@end
