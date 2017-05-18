//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Rushan on 2017-05-18.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "WavyFlowLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) WavyFlowLayout *wavyLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLayout];  //call layout
}

-(void)setUpLayout{
    self.wavyLayout = [[WavyFlowLayout alloc]init];  //initialize wavy flow
    [self.wavyLayout prepareLayout];  //call wavy method

    self.collectionView.collectionViewLayout = self.wavyLayout;  //set current view to wavylayout
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
