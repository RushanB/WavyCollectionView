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
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal; //horizontal scrolling
    self.itemSize = CGSizeMake(100, 50);  //cell size
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

//-(CGSize)collectionViewContentSize{
//    CGSize sizeOfView = [self collectionView].contentSize;
//    return sizeOfView;
//}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    //copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [NSMutableArray new];
    
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;  //max height
    
    for(UICollectionViewLayoutAttributes *attributes in superAttrs){
        CGFloat randY = arc4random_uniform(collectionViewHeight - self.itemSize.height);  //randomize y values
        UICollectionViewLayoutAttributes *attributesCopy = [attributes copy];
        attributesCopy.frame = CGRectMake(attributesCopy.frame.origin.x, randY, self.itemSize.width, ((collectionViewHeight-randY)/100)*self.itemSize.height);  //set height
        [newAttrs addObject:attributesCopy];  //new attrs get copied attrs
    }
    
    return newAttrs;
}

@end
