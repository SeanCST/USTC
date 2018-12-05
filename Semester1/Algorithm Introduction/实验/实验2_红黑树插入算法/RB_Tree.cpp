//
//  RB_Tree.cpp
//  RBTree
//
//  Created by 肖恩伟 on 2018/11/7.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include "RB_Tree.h"
#include <queue>

// 插入节点
void RB_Tree::RB_Insert(TreeNode *z) {
    TreeNode *y = Nil;
    TreeNode *x = root;
    
    // 从根节点往下找到待插入的的叶子结点的位置
    while (x != Nil) {
        y = x;
        if (z->key < x->key) {
            x = x->left;
        } else {
            x = x->right;
        }
    }
    
    z->p = y; // 设置 z 的父结点指针
    // 使 z 的父结点正确地指向 z，若父结点为空，则将 z 设置为根结点
    if (y == Nil) {
        root = z;
    } else if (z->key < y->key) {
        y->left = z;
    } else {
        y->right = z;
    }
    
    z->left = Nil;
    z->right = Nil;
    z->color = RED;
    
    // 调整使其满足红黑树的结构要求
    RB_Insert_Fixup(z);
}

// 插入之后的调整
void RB_Tree::RB_Insert_Fixup(TreeNode *z) {
    while (z->p->color == RED) { // 父结点为红色才需要调整
        
        // 父结点为左孩子的情况
        if (z->p == z->p->p->left) {
            TreeNode *y = z->p->p->right; // y 为 z 的叔叔结点

            // case 1
            if (y->color == RED) { // 叔叔结点为红色
                // 将其叔叔和父亲都设置为黑色，祖父设置为红色，并将祖父赋值给 z，继续向上调整
                z->p->color = BLACK;
                y->color = BLACK;
                z->p->p->color = RED;
                z = z->p->p;
            }
            
            else { // 叔叔结点为黑色
                
                // case 2 ：z 是父结点的右孩子，将父结点赋值给 z，在对其进行左旋
                if (z == z->p->right) {
                    z = z->p;
                    LeftRotate(z);
                }
                
                // case 3 ：将父结点设置为黑，祖父节点设置为红，对其祖父进行右旋
                z->p->color = BLACK;
                z->p->p->color = RED;
                RightRotate(z->p->p);
            }
        }
        
        // 父结点不是左孩子的情况
        else {
            TreeNode *y = z->p->p->left; // y 为 z 的叔叔结点
            
            // case 1
            if (y->color == RED) { // 叔叔结点为红色
                // 将其叔叔和父亲都设置为黑色，祖父设置为红色，并将祖父赋值给 z，继续向上调整
                z->p->color = BLACK;
                y->color = BLACK;
                z->p->p->color = RED;
                z = z->p->p;
                
            } else { // 叔叔结点为黑色
                
                // case 2 ：z 是父结点的右孩子，将父结点赋值给 z，在对其进行左旋
                if (z == z->p->left) { // z 是父结点的右孩子
                    z = z->p;
                    RightRotate(z);
                }
                
                // case 3 ：将父结点设置为黑，祖父节点设置为红，对其祖父进行右旋
                z->p->color = BLACK;
                z->p->p->color = RED;
                LeftRotate(z->p->p);
            }
        }
    }
    
    root->color = BLACK;
}

// 左旋操作
void RB_Tree::LeftRotate(TreeNode *x) {
    
    TreeNode *y = x->right; // y 为 x 的右孩子

    // 将 y 的左孩子赋给 x 的右孩子
    x->right = y->left;
    if (y->left != Nil) {
        y->left->p = x;
    }
    
    // 若 x 原本为根结点，则将 y 设为根结点，否则将 x 的父结点赋给 y 作为父结点
    y->p = x->p;
    if (x->p == Nil) {
        root = y;
    } else if (x == x->p->left) {
        x->p->left = y;
    } else {
        x->p->right = y;
    }
    
    // 连接 x 和 y
    y->left = x;
    x->p = y;
}

// 右旋操作
void RB_Tree::RightRotate(TreeNode *x) {
    
    TreeNode *y = x->left; // y 为 x 的右孩子
    
    // 将 y 的右孩子赋给 x 的左孩子
    x->left = y->right;
    if (y->right != Nil) {
        y->right->p = x;
    }
    
    // 若 x 原本为根结点，则将 y 设为根结点，否则将 x 的父结点赋给 y 作为父结点
    y->p = x->p;
    if (x->p == Nil) {
        root = y;
    } else if (x == x->p->right) {
        x->p->right = y;
    } else {
        x->p->left = y;
    }
    
    // 连接 x 和 y
    y->right = x;
    x->p = y;
}

// 打印树
void RB_Tree::TreePrint() {
    TreeNode *y = root;
    queue<TreeNode *> q;
    q.push(y);
    
    while(!q.empty()) {
        y = q.front();
        q.pop();
        
        // 打印
        cout << y->key;
        if (y->color == RED) {
            cout << " 红 是";
        } else {
            cout << " 黑 是";
        }
        if (y == root) {
            cout << "根结点" << endl;
        } else {
            if (y == y->p->left) {
                cout << y->p->key << "的左孩子" << endl;
            } else {
                cout << y->p->key << "的右孩子" << endl;
            }
        }
        
        if (y->left != Nil) {
            q.push(y->left);
        }
        if (y->right != Nil) {
            q.push(y->right);
        }
    }
}
