//
//  TableViewController.m
//  SA18225410_肖恩伟_实验4
//
//  Created by SeanCST on 2018/12/20.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"
#import "ViewController.h"

@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *students;
@property (nonatomic, strong) Student *student;
@property (nonatomic, copy) NSString *path;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)refresh:(UIRefreshControl *)sender {
    [self.refreshControl beginRefreshing];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingString:@"students.plist"];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:self.path];
    self.students = [NSMutableArray array];
    for (NSData *s in dataArray) {
        [self.students addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
    
//    [self.tableView reloadData];
}

- (void)writeToFile:(NSMutableArray *)sts FilePath:(NSString *)path {
    NSData *data;
    NSMutableArray *ds = [NSMutableArray array];
    for (Student *s in sts) {
        data = [NSKeyedArchiver archivedDataWithRootObject:s];
        [ds addObject:data];
    }
    
    [ds writeToFile:path atomically:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addInfo"]) {
        if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students = self.students;
            vc.indexPath = nil;
            vc.path = self.path;
        }
    }  else if ([segue.identifier isEqualToString:@"showDetail"]) {
        if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students = self.students;
            vc.indexPath = indexPath;
            vc.path = self.path;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.students removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self writeToFile:self.students FilePath:self.path];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    self.student = self.students[indexPath.row];
    cell.textLabel.text = self.student.name;
    cell.detailTextLabel.text = self.student.number;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modifyView"];
    vc.students = self.students;
    vc.indexPath = indexPath;
    vc.path = self.path;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
