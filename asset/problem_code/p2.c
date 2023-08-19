#include <stdio.h>

// reverse_array() takes an array of integers and its size as arguments
// int *array is a pointer to the first element of the array
// int num_elements is the number of elements in the array
void reverse_array( int *array, int num_elements ) {
    for (int i = 0; i < num_elements/2; i++){
        int temp = array[i];
        array[i] = array[num_elements - 1 - i];
        array[num_elements - 1 - i] = temp;
    }
}

//new code
void reverse_array2(int *array, int num_elements) {
    int *start = array;
    int *end = array + num_elements - 1;
    while (start < end){
        int temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

void print_array( int *array, int num_elements ) {
    for ( int i=0; i < num_elements; i++ ) {
        printf( "%d%s", array[i],
        (i==num_elements-1) ? "\n" : "," );
    }
}

int main(void) {
    int a[] = { 1,2,3,4,5 };
    int n = sizeof(a)/sizeof(int);
    reverse_array2( a, n );
    print_array( a, n );
    reverse_array2( &a[2], n-2 );
    print_array( a, n );
    return 0;
}