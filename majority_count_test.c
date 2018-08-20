/* ********************************
 * CSE 30 - HW 4
 * ********************************/

#include <stdio.h>
#include "majority_count.h"

int main(int argc, char ** argv) {

    int data[] = {0, 0, 0, 1};
    int data2[] = {1,2,3,4,5,6};
    int data3[] = {1,1,1,1,3,2};

    int c_majority, arm_majority, arm_majority2, arm_majority3;
    int c_count = majority_count(data, 4, &c_majority);
    int arm_count = majority_count_ARM(data, 4, &arm_majority);
    
    int arm_count2 = majority_count_ARM(data2, 6, &arm_majority2);
    int arm_count3 = majority_count_ARM(data3, 6, &arm_majority3);
    

    printf("C   Majority Count  : %d\n", c_count);
    printf("C   Majority Element: %d\n", c_majority);
    printf("ARM Majority Count  : %d\n", arm_count);
    printf("ARM Majority Element: %d\n", arm_majority);
    printf("ARM Majority Element: %d\n", arm_majority2);
    printf("ARM Majority Count  : %d\n", arm_count2);
    printf("ARM Majority Element: %d\n", arm_majority3);
    printf("ARM Majority Count  : %d\n", arm_count3);


    return 0;
}
