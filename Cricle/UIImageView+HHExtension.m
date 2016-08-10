//
//  UIImageView+HHExtension.m
//  百思不得姐
//
//  Created by LOVE on 16/3/29.
//  Copyright © 2016年 LOVE. All rights reserved.
//

#import "UIImageView+HHExtension.h"
#import "UIImage+HHExtension.h"
#import "UIImageView+WebCache.h"


@implementation UIImageView (HHExtension)
- (void)setHeader:(NSString *)url{
    
     UIImage *placeholder = [[UIImage imageNamed:@"Snip20160726_2.png"] circleimage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image?[image circleimage]:placeholder;
        
    }];


}
@end
