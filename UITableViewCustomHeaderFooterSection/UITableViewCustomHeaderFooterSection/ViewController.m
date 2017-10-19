//
//  ViewController.m
//  UITableViewCustomHeaderFooterSection
//
//  Created by shourov datta on 10/19/17.
//  Copyright © 2017 shourov datta. All rights reserved.
//

#import "ViewController.h"
#import "AMSTableViewSectionHeader.h"


static NSString *SectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";
static NSString *SectionFooterViewIdentifier = @"SectionFooterViewIdentifier";

@interface ViewController ()<UITableViewDataSource ,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"Header" bundle:nil] forHeaderFooterViewReuseIdentifier:SectionHeaderViewIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"Footer" bundle:nil] forHeaderFooterViewReuseIdentifier:SectionFooterViewIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITV Delegate and DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    }
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 
    NSString *cellIdentifire = @"tableViewCell";
    UITableViewCell *cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifire];
    if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifire];
            }
    
    cell.textLabel.text = [NSString stringWithFormat:@"This is Section %ld Row :%ld",indexPath.section , indexPath.row];
    
    return cell;
            
}
// Header Section
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    AMSTableViewSectionHeader *sectionHeaderView = (AMSTableViewSectionHeader *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionHeaderViewIdentifier];
    
    sectionHeaderView.titleLabel.text = [NSString stringWithFormat:@"This is Header Section %ld",(long)section ];
    sectionHeaderView.imageView.image = [UIImage imageNamed:@"Home.png"];
    return sectionHeaderView;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 70;
}



// Header Section
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    AMSTableViewSectionHeader *sectionHeaderView = (AMSTableViewSectionHeader *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionHeaderViewIdentifier];
    
    sectionHeaderView.titleLabel.text = [NSString stringWithFormat:@"This is Footer Section %ld",(long)section ];
    sectionHeaderView.imageView.image = [UIImage imageNamed:@"Home.png"];
    sectionHeaderView.imageView2.image = [UIImage imageNamed:@"Home.png"];

    return sectionHeaderView;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 70;
}



@end
