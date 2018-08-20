/* ********************************
 * CSE 30 - HW 3
 * ********************************/

#include <stdio.h>
#include "substring.h"

int main() {
    // put your test code here
    char * strL = "This is the test for substring.s";
    char * strS = "substring.s";
    int result = 0;
    result = substring(strL, strS);
    printf("The return value is %d \n", result);

    result = substring(strS, strL);
    printf("The return value is %d \n", result);

    char * test1 = "ahahahahahahhahahahahah";
    char * test2 = "ahahahahahahhahahahahaa";

    result = substring(test1, test2);
    printf("The return value is %d \n", result);
    return 0;
}
