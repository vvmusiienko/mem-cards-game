//
//  MCImagePickerViewController.m
//  MemCards
//
//  Created by bogash on 30.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCImagePickerViewController.h"
#import "MCGameField.h"
#import "MCCard.h"
@interface MCImagePickerViewController ()

@end


@implementation MCImagePickerViewController

@synthesize imageView,photoLibrary, standardIcons, mainViev, iconViev;

-(IBAction) getStandartIcons:(id) sender{
    
    int icon_tag=1;
    [iconViev setHidden:NO];
    [mainViev setHidden:NO];
    MCGameField *testField=[[MCGameField alloc] init];
    [testField setwidth:2 AndHeight:4];
    
    int sepWidth=10;
    int padding=4;
    int separateX=([testField getWidth]/2-1)*sepWidth;
    int separateY=([testField getHeight]/2-1)*sepWidth;
    int cellwidth= (320-separateX)/[testField getWidth];
    int cellhight= (350-separateY)/[testField getHeight];
    int leftPadding=((320 -separateX)- cellwidth*[testField getWidth])/2;
    int topPadding=((350 -separateY)- cellhight*[testField getHeight])/2;
    int topSep=0;
    int leftSep=0;
    
    for (int row=0;row<[testField getWidth];row++){     
        if (row%2==0 && row>0 && [testField getWidth]%2==0) {
            leftSep=leftSep+ sepWidth;
        }
        for (int cell=0;cell<[testField getHeight];cell++){        
            if (cell%2==0 && cell>0 && [testField getHeight]%2==0) {
                topSep= topSep+ sepWidth;
            }
            int left = row*cellwidth +leftSep+leftPadding+padding/2;            
            int top =cell*cellhight+50+topSep+topPadding;  
            icon_name  = [[NSString alloc] initWithFormat:@"icon%d", icon_tag];            
            UIImage *icon_image = [UIImage imageNamed:icon_name];
            UIButton * icon = [UIButton buttonWithType:UIButtonTypeCustom];
            [icon setImage:icon_image forState:UIControlStateNormal];
            [icon addTarget:self action:@selector(iconClicked:) forControlEvents:UIControlEventTouchUpInside];
            icon.tag = icon_tag; 
            icon_tag++;           
            icon.frame=CGRectMake(left, top, cellwidth-padding, cellhight-padding);
            [self.iconViev addSubview:icon];
        }topSep=0;
        
    }
    
    
    
}

- (IBAction) iconClicked:(id)sender {
    
   UIButton *current_icon=sender;
    icon_name  = [[NSString alloc] initWithFormat:@"icon%d", current_icon.tag ];
    imageView.image=[UIImage imageNamed:icon_name];
    imageShirt=imageView.image;
    [iconViev setHidden:YES];
    [mainViev setHidden:NO];  
    [self saveImage:imageShirt withFileName:@"BackSide" ofType:@"png" inDirectory:documentsDirectoryPath];

    
}

-(IBAction) goBack:(id) sender{ 

    [iconViev setHidden:YES];
    [mainViev setHidden:NO];

}

-(IBAction) getFromPhotoLibrary:(id) sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary ;    
	[self presentModalViewController:picker animated:YES];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissModalViewControllerAnimated:YES];
    imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    imageShirt = imageView.image;
    [self saveImage:imageView.image withFileName:@"BackSide" ofType:@"png" inDirectory:documentsDirectoryPath];


}

-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    }  
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [iconViev setHidden:YES];
    [mainViev setHidden:NO];
    imageView.image= imageShirt;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end

