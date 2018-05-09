//Pequeño programa que calcula el primer múltiplo de 64 mayor a 15360
#include <iostream>
#include <stdlib.h>
using namespace std;

int main(){
  int i= 15361;

  while(true){
    if(i % 64 == 0 && i % 12 == 0){
      cout << i;
      exit(EXIT_SUCCESS);
    }
    i++;
  }
}
