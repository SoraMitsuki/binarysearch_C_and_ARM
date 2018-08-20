/* ********************************
 * CSE 30 - HW 4
 *
 * This is the c version of str to int. This function convert the char numbe * rs into int
 * ********************************/

/*
 * Name: Jiaqi Fan
 * PID: A12584051
 * UserID: SoraMitsuki
 *
 * Name: Xuanru Zhu
 * PID: A91064234
 * UserID: Aaron12138
 */

#include <stdio.h>

/*
 * str_to_int take 2 param
 * This function convert the char numbers into int
 * @ return return 1 for successful otherwise 0
 * @ Param the input char only contain char 0-9
 * @ Param the output for int
 */

int str_to_int(char * s, int * dest){
  if(s == NULL || dest == NULL){ // null check for 2 param
    return 0; //return 0 for fail
  }
  if(*s == NULL){ //check for s is empty string
    return 0;
  }
  char * tmp = s;
  tmp++;
  if(*s == '-' && *tmp == NULL){ //check s only contain - or not
    return 0;
  }
  tmp = s;
  while(*tmp){ //check if - is in the middle on the string
    tmp++;
    if(*tmp == '-'){
      return 0;
    }
    else{
      continue;
    }
  }
  tmp = s;
  if(*tmp == '-'){ //check the input is char 0-9 or not
    tmp++; // this is for negative number
    while(*tmp){
      if(*tmp < 48 || *tmp > 57){
        return 0;
      }
      tmp++;
    } 
  }
  else{
    while(*tmp){ //this is for positive number
      if(*tmp < 48 || *tmp > 57){
        return 0;
      }
      tmp++;
    }
  }
  tmp--;
  int bias = 48;
  int count = 1;
  int power = 10;
  while(tmp != s){ //loop the string backward
    *dest = *dest + ((*tmp - bias) * count); 
  // take the ascii and subtrace 48 for bias and add to dest
    count = count * power; // increase the decimal place by 10
    tmp--;
  }
  if(*tmp == '-'){
    *dest = -1 * (*dest); // if it is negative number flip it
  }
  else{
    *dest = *dest + ((*tmp - bias) * count);
    //if it is positive number add the first digit
  }
  return 1; //return 1 for success
}

