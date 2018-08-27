//
//  MyCell.m
//  PictureShow
//
//  Created by caimengnan on 2018/8/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

@property (nonatomic,strong) CAShapeLayer *circleLayer;
@property (nonatomic,strong) UIBezierPath *path;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UIImageView *imageView2;
@property (nonatomic,assign) CGPoint centerPoint;
@property (nonatomic,assign) CGFloat radius;

@end


@implementation MyCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}




- (CAShapeLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.frame = self.imageView1.bounds;
        self.path = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(0, 0, 0, 0))];
        _circleLayer.path = self.path.CGPath;
    }
    return _circleLayer;
}


- (void)setUpUI {
    
    _imageView1 = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, kWidth, 200))];
    _imageView1.image = [UIImage imageNamed:@"123"];
    self.imageView1 = _imageView1;
    
    _imageView2 = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, kWidth, 200))];
    _imageView2.image = [UIImage imageNamed:@"456"];
    self.imageView2 = _imageView2;
    
    [self.contentView addSubview:self.imageView1];
    [self.contentView addSubview:self.imageView2];
    [self.contentView insertSubview:self.imageView1 belowSubview:self.imageView2];
    
    self.imageView2.layer.mask = self.circleLayer;
    
}


- (void)setContendOffset:(CGFloat)contendOffset
{
    _contendOffset = contendOffset;
    
    //圆心 （图片的中心点）
    CGPoint center = CGPointMake(kWidth/2, 100);
    //半径
    CGFloat radius = _contendOffset;
    
    if (radius < 0) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.path = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2))];
        self.circleLayer.path = self.path.CGPath;
    });
    
    [self layoutIfNeeded];
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
