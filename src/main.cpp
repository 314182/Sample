#include <iostream>
using namespace std;
int add(int a,int b);
int subt(int a,int b);
int mult(int a,int b);
int divi(int a,int b);
int main(){
  int firstnum,secondnum,sum,sub,mul,div;
  cout << "enter two integers";
  cin >> firstnum >> secondnum >> endl;
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
int add(int a,int b){
  return a+b;
}
int subt(int a,int b){
  return a-b;
}
int mult(int a,int b){
  return a*b;
}
int divi(int a,int b){
  if(a>b){
  return a/b;
  }
  else{
    return 0;
  }  
}
  
  
