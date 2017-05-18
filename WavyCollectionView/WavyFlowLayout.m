//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Rushan on 2017-05-18.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout

-(void)prepareLayout{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(CGSize)collectionViewContentSize{
    CGSize sizeOfView = [self collectionView].contentSize;
    return sizeOfView;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    //copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] initWithArray:superAttrs];
    
    for(UICollectionViewLayoutAttributes *attributes in newAttrs){
        CGFloat randY = arc4random_uniform(600);
        attributes.frame = CGRectMake(attributes.frame.origin.x, randY, self.itemSize.width, self.itemSize.height);
    }
    
    
    
    return newAttrs;
}

@end
