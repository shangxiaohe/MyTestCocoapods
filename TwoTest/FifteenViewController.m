//
//  FifteenViewController.m
//  TwoTest
//
//  Created by ren on 2018/2/1.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "FifteenViewController.h"
#import "FourteenTableViewCell.h"

@interface FifteenViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *collectionView;

@end

@implementation FifteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    CGFloat rgb = 244 / 255.0;
    _layout.minimumLineSpacing = 10;
    _layout.minimumInteritemSpacing = 10;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
    _collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    
    NSDictionary *dic = @{@"key1":@[@1,@"dds"],@"key2":@"aaaaaa"};
    NSMutableArray *arr = (NSMutableArray*)[dic objectForKey:@"key1"];
    NSArray *arr1 = @[arr,@3,@"dd"];
    [arr removeObject:@1];
    NSLog(@"%@",arr1);
    
    NSMutableArray *arr2 = arr;
    NSLog(@"arr2--%@",arr2);
    [arr2 addObject:@"ll"];
    
    NSLog(@"arr1---%@",arr1);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int size[] = {20,50,80,140,200,50,70,90,300,10};
    return CGSizeMake(size[indexPath.row], size[indexPath.row]);
}

@end
