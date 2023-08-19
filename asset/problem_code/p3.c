#include <stdio.h>
#include <string.h>

int count_zeros( const char *str ) {
    int result = 0;
    for (int i = 0; i < strlen(str); i++){
        char c = str[i];
        if (c == '0'){
            result++;
        }
        else if (!(c == '1')){
            return -1;
        }
    }
    return result;
}

//implement count_zeros2() here
//use pointer arithmetic
int count_zeros2( const char *str ) {
    int result = 0;
    char *start = str;
    while (*start != '\0'){
        if (*start == '0'){
            result++;
        }
        else if (*start != '1'){
            return -1;
        }
        start++;
    }
    return result;
}

int main(void) {
    char *arr[] = {"", "0", "1", "00", "0110", "01001110111011"};

    // compute the number of strings in the array 'arr'
    int n = sizeof( arr ) / sizeof( char * );
    printf( "n = %d\n", n );

    for ( int i=0; i < n; i++ ) {
        char *str = arr[i];
        int result = count_zeros2( str );
        if ( result == -1 ) {
            printf( "Invalid binary string: %s\n", str);
        }
        else {
            int len = strlen( str );
            printf( "#0 = %d, #1 = %d, s='%s'\n",
            result, len - result, str );
        }
    }
    return 0;
}