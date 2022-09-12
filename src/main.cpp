#include "main.h"
int main(){
  int firstnum,secondnum,sum,sub,mul;
  float div;
  cout << "enter two integers";
  cin >> firstnum;
  cin >> secondnum;
  if(firstnum >= 0 && secondnum >=0){
  sum = add(firstnum,secondnum);
  cout << "The sum of two num is:"<< sum << endl;
  sub = subt(firstnum,secondnum);
  cout << "The sub of two num is:"<< sub << endl;
  mul = mult(firstnum,secondnum);
  cout << "The mul of two num is:"<< mul << endl;
  div = divi(firstnum,secondnum);
  cout << "The div of two num is:"<< div << endl;
  }
  else{
    cout<<"enter valid numbers";
  }
  return 0;
}

