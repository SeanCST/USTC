//
//  main.cpp
//  改进快排
//
//  Created by 肖恩伟 on 2018/10/31.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include<iostream>
using namespace std;

#define COUNT 1000000

// 定义 k
int k = 100;

// 划分
int Partition(int *A, int p, int r)
{
    // 选择A[r]作为主元
    int x = A[r];
    int i = p - 1, j;
    for(j = p; j < r; j++)
    {
        // 小于主元的放在左边
        if(A[j] < x || (A[j] == x))
        {
            i++;
            // 把大于主元的交换到右边
            swap(A[i],A[j]);
        }
    }
    swap(A[i+1], A[r]);
    // 返回最终主元的位置
    return i+1;
}

// 优化快速排序
void Mod_QuickSort(int *A, int p, int r)
{
    // 长度小于k的子数组不排序
    if(r - p >= k)
    {
        // 以某个主元为标准，把数组分为两部分，左边都比主元小，右边都比主元大
        int q = Partition(A, p, r);
        // 分别对左边和右边排序
        Mod_QuickSort(A, p, q-1);
        Mod_QuickSort(A, q+1, r);
    }
}

// 未优化快速排序
void QuickSort(int *A, int p, int r)
{
    // 长度小于k的子数组不排序
    if(r >= p)
    {
        // 以某个主元为标准，把数组分为两部分，左边都比主元小，右边都比主元大
        int q = Partition(A, p, r);
        // 分别对左边和右边排序
        QuickSort(A, p, q-1);
        QuickSort(A, q+1, r);
    }
}

// 插入排序
void InsertSort(int *A, int p, int r)
{
    int i, j;
    for(i = p + 1; i <= r; i++)
    {
        int temp = A[i];
        j = i;
        while(A[j-1] > temp)
        {
            A[j] = A[j-1];
            j--;
        }
        A[j] = temp;
    }
}

void Mod_Sort(int *A, int p, int r)
{
    // 先进行粗粒度的快排
    Mod_QuickSort(A, p, r);
    // 逐个进行插入排序
    InsertSort(A, p, r);
}


// 生成元素为随机数的数组
void Random(int a[],int n)
{
    int i = 0;
    srand( (unsigned)time( NULL ) );
    while(i<n)
    {
        a[i++] = rand() % 9999;
    }
}

int main() {
    
    int A[COUNT] = {0};
    // 生成随机数组
    Random(A, COUNT);
    clock_t startTime, endTime;
    
    // 改进
    startTime = clock();
    Mod_Sort(A, 0, COUNT - 1);
    endTime = clock();
    cout << "改进后时间: " <<(double)(endTime - startTime) * 1000 / CLOCKS_PER_SEC << " ms" << endl;
    // 输出
//    for (int i = 0; i < COUNT ; i++) {
//        cout << A[i] << " ";
//    }
    cout << endl;

    
    // 未改进
    Random(A, COUNT);
    startTime = clock();
    QuickSort(A,  0, COUNT - 1);
    endTime = clock();
    cout << "改进前时间: " <<(double)(endTime - startTime) * 1000 / CLOCKS_PER_SEC << " ms" << endl;
//    // 输出
//    for (int i = 0; i < COUNT ; i++) {
//        cout << A[i] << " ";
//    }
    cout << endl;
    
    return 0;
}
