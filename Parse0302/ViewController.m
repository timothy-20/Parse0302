//
//  ViewController.m
//  Parse0302
//
//  Created by 임정운 on 2021/03/02.
//

#import "ViewController.h"
#import "InsertDataCell.h"

@interface ViewController ()
{
    NSMutableArray *dataArray;
    int insertRow;
}

@property (weak, nonatomic) IBOutlet UITableView *coffeeMainTable;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addCell;
@property (weak, nonatomic) IBOutlet UIButton *editCell;


- (IBAction)addCellAction:(id)sender;

@end

@implementation ViewController

//-(UINib *)cellNib
//{
//    UINib *nib;
//    nib = [UINib nibWithNibName:@"InsertDataCell" bundle:nil];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    insertRow = 1;
    dataArray = [[NSMutableArray alloc] init];

    self.coffeeMainTable.delegate = self;
    self.coffeeMainTable.dataSource = self;
    
    [self.coffeeMainTable registerNib:[UINib nibWithNibName:@"InsertDataCell" bundle:nil] forCellReuseIdentifier:@"InsertCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InsertDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertCell"];
    
    cell.cellLabel.text = [NSString stringWithFormat:@"coffee-%d", dataArray.count];
    cell.cellInput.placeholder = [NSString stringWithFormat:@"Insert coffee name"];
    cell.cellEnter.hidden = NO;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [dataArray removeObjectAtIndex: indexPath.row];
        [self.coffeeMainTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (IBAction)addCellAction:(id)sender
{
    //[self.dataArray addObject:[NSString stringWithFormat: @"text%ld", [self.coffeeMainTable numberOfSections]]];
    //self.dataArray = [[NSMutableArray alloc] initWithObjects:@"test", nil];
    
    self.editCell.selected = NO;
    [self.coffeeMainTable setEditing:NO animated:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count inSection:0];
    NSArray *pathArray = [NSMutableArray arrayWithObject:indexPath];
    
    [dataArray addObject:[NSString stringWithFormat:@"추가된 행: %d", insertRow]];
    insertRow++;
    
    [self.coffeeMainTable insertRowsAtIndexPaths:pathArray withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)editCellAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    [sender setTitle:@"Done" forState:UIControlStateSelected];
    [sender setTitle:@"Edit" forState:UIControlStateDisabled];
    
    if(sender.selected == YES) {
//        NSLog(@"yes");
        [self.coffeeMainTable setEditing:YES animated:YES];
    }
    
    else if (sender.selected == NO) {
//        NSLog(@"no");
        [self.coffeeMainTable setEditing:NO animated:YES];
    }

//    [self.coffeeMainTable setEditing: !self.coffeeMainTable.editing];
//    if(self.coffeeMainTable.editing) {
//        if(dataArray.count > 0) {
//            [self.editCell.layer setContents: [NSString stringWithFormat:@"Done"]];
//        }
//    } else if(!self.coffeeMainTable.editing) {
//        if(dataArray.count == 0) {
//
//        }
//        [self.editCell.layer setContents: [NSString stringWithFormat:@"Edit"]];
//    }
}

@end
