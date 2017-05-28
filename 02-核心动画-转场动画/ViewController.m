//
//  ViewController.m
//  02-核心动画-转场动画
//
//  Created by SummerXie on 17/2/17.

//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, assign) NSInteger index;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.index = 0;
    
    self.images = [NSMutableArray array];
    
    for (int i = 0; i < 6; i++) {
        // 拼图片的名字
        NSString *imageName = [NSString stringWithFormat:@"image%zd", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.images addObject:image];
    }
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    
    CATransition *anim = [[CATransition alloc] init];
    anim.type = @"cube";
    
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) { // 从右往左
        self.index++;
        
        anim.subtype = kCATransitionFromRight;
        
        if(self.index == self.images.count) {
            self.index = 0;
        }
    } else { // 从左往右
        self.index--;
        
        anim.subtype = kCATransitionFromLeft;
        
        if(self.index == -1) {
            self.index = self.images.count - 1;
        }
    }
    
    self.imageView.image = self.images[self.index];
    
    [self.imageView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
