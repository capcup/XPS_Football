#include <iostream>
#include <stdio.h>
using namespace std;




int binarySearch(int arr[], int min, int max, int x){ 
    while (min<=max) 
    { 
        int m = min+ (max-min)/2;   
        // Check if x is present at mid 
        if (arr[m] == x) 
            return m; 
        // If x greater, ignore left half 
        if (arr[m] < x) 
            min= m + 1;   
        // If x is smaller, ignore right half 
        else
            max = m - 1; 
    }   
    // if we reach here, then element was 
    // not present 
    return -1; 
}

int chop(int array[], int length, int search){
    /*
    ** naive search 
    for(int i=0; i<length; i++){
        if (array[i]==search)
            return i;
    }
    return -1;
    */
   return binarySearch(array,0,length,search);
}

int main(){
    const int size = 10;
    int foo[size];
    bool switch_ = true;
    for(int i=0; i<size;i++){
        if(i%2 ==0)
            foo[i] = i*2;
        else 
            foo[i] = i*2+1;
        switch_ = !switch_;
        cout << foo[i] << endl;      
    }
    cout << chop(foo,size,12) << endl;
    return 0;
}