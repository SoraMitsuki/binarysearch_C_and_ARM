/* ********************************
 * CSE 30 - HW 4
 * ********************************/

#include <stdio.h>
#include "binary_search.h"

int main(int argc, char ** argv) {
    int data[] = {1,2,3,4,5,6,7,8,9,10};
    int data2[] = {1,3,5,7,9,11,13,14,15};

    printf("C   Binary Search: %d\n", binary_search(data, 4, 0, 9));
    printf("ARM Binary Search: %d\n", binary_search_ARM(data, 4, 0, 9));

    printf("ARM Binary Search: %d\n", binary_search_ARM(data2, 4, 0, 9));
    printf("ARM Binary Search: %d\n", binary_search_ARM(data2, 11, 0, 9));

    return 0;
}
