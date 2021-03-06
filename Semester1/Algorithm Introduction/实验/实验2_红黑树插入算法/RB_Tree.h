//
//  RB_Tree.h
//  RBTree
//
//  Created by 肖恩伟 on 2018/11/7.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include <iostream>
using namespace std;

// 定义红黑树的两种颜色
enum RB_COLOR {
    RED,
    BLACK
};

class RB_Tree;

// 类 - 红黑树的结点
class TreeNode {
    friend RB_Tree;
private:
    RB_COLOR color;
    int key;
    TreeNode *p;
    TreeNode *left;
    TreeNode *right;
    
public:
    // 构造函数
    TreeNode():color(BLACK), p(NULL), left(NULL), right(NULL) {};
    TreeNode(int k):color(BLACK), key(k), p(NULL), left(NULL), right(NULL) {};
    TreeNode(const TreeNode &node) {
        color = node.color;
        key = node.key;
        p = node.p;
        left = node.left;
        right = node.right;
    }
    // 析构函数
    ~TreeNode() {
        p = NULL;
        left = NULL;
        right = NULL;
    }
};

// 类 - 红黑树
class RB_Tree {
private:
    TreeNode *root; // 树根
    TreeNode *Nil; // 哨兵结点 T.nil
public:
    // 构造函数
    RB_Tree() {
        Nil = new TreeNode(); // 初始化 Nil 结点，颜色默认为黑
        Nil->p = Nil;
        Nil->left = Nil;
        Nil->right = Nil;
        root = Nil; // 初始化 root 结点
    }
    // 析构函数
    ~RB_Tree() {
        delete Nil;
        Nil = NULL;
        root = NULL;
    }
    
    void LeftRotate(TreeNode *x); // 左旋转
    void RightRotate(TreeNode *x); // 右旋转
    void RB_Insert(TreeNode *z); // 结点插入
    void RB_Insert_Fixup(TreeNode *z); // 红黑树插入调整
    
    void TreePrint(); // 打印树
};
