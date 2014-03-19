//
//  ViewController.m
//  ScanQRCode
//
//  Created by Xchobo on 2014/3/19.
//  Copyright (c) 2014年 Xchobo. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeViewController.h"

#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7

@interface ViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UILabel *qrcodedataLabel;
@property (strong, nonatomic) QRCodeViewController *QRCVC;

- (IBAction)scanQRCodeBtn:(id)sender;
- (IBAction)readQRCodeDataBtn:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 可由此產生 QRCode: http://www.qr-123.com/zh-TW
    
    //
    [_messageLabel setText:@"按下QRCode進行掃描"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanQRCodeBtn:(id)sender {
    if(IOS7){
        if (_QRCVC == nil) {
            _QRCVC = [[QRCodeViewController alloc] init];
        }
        [self presentViewController:_QRCVC animated:YES completion:nil];
    }
    else{
        [_messageLabel setText:@"僅支援iOS7"];
    }
}

- (IBAction)readQRCodeDataBtn:(id)sender {
    [_qrcodedataLabel setText:[_QRCVC returnData]];
}
@end
