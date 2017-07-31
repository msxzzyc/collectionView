//
//  ZYCLineLayout.m
//  collectionView
//
//  Created by wpzyc on 2017/7/31.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCLineLayout.h"

@implementation ZYCLineLayout
- (instancetype)init
{
    if (self = [super init]) {
        
        /**
         UICollectionViewLayoutAttributes *attrs;
         1.一个cell对应一个UICollectionViewLayoutAttributes对象；
         2.UICollectionViewLayoutAttributes对象决定了cell的frame
         */
    }
    return self;
}
/**
 *当collectionview的显示范围发生改变时，是否需要重写布局
 *一旦重写布局，就会调用layoutAttributesForElementsInRect:方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 *这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
 *这个方法的返回值决定了rect范围内所有元素的排布（frame）
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //获得super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //计算CollectionView最中心点的x值
   CGFloat collectionViewCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width*0.5;


    //在原有布局属性的基础上，进行微调
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //计算cell的中心点x和collectionview中心点x的间距
        CGFloat delta = ABS(attrs.center.x - collectionViewCenterX);
        //根据间距值计算cell的缩放比例
        CGFloat scale = 1.1 - delta/self.collectionView.frame.size.width;
       //计算缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }

    return array;
}
@end
