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
 *这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
 *这个方法的返回值决定了rect范围内所有元素的排布（frame）
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //获得super已经计算好的布局属性
    NSArray *original = [super layoutAttributesForElementsInRect:rect];
    NSArray *array =  [[NSArray alloc]initWithArray:original copyItems:YES];

    //在原有布局属性的基础上，进行微调
    for (UICollectionViewLayoutAttributes *attrs in original) {
        CGFloat scale = arc4random_uniform(100/100.0);
       
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }

    return array;
}
@end
