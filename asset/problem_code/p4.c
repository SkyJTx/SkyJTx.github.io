#include "stdio.h"
#include "string.h"

int detect_pattern(const char *str){
    if (strlen(str) < 2){
        return 0;
    }
    char check[] = {str[0], str[1]}; // you can use 2 variables instead of array
    for (int i = 2; i < strlen(str); i++){
        if ((check[0] == '1') && (check[1] == '0')){
            for (int j = i; j < strlen(str); j++){
                if (str[j] == '1'){
                    return 1;
                }
            }
            return 0;
        }
        check[0] = str[i - 1];
        check[1] = str[i];
    }
    return 0;
}

//new detect pattern
int detect_pattern2(const char *str){
    char *start = str;
    char *end = str + strlen(str) - 1;
    while (start < end){
        if ((*start == '1') && (*(start + 1) == '0')){
            while (start < end){
                if (*end == '1'){
                    return 1;
                }
                end--;
            }
            return 0;
        }
        start++;
    }
}

int detect_pattern3(const char *str){
    int state = 0;
    char *temp = str;
    while (state == 0 && *temp != '\0'){
        if (*temp == '1'){
            state++;
        }
        temp++;
    }
    while (state == 1 && *temp != '\0'){
        if (*temp == '0'){
            state++;
        }
        else if (*temp == '1'){
            return detect_pattern3(temp);
        }
        temp++;
    }
    while (state == 2 && *temp != '\0'){
        if (*temp == '1'){
            return 1;
        }
        temp++;
    }
    return 0;
}

int main(){
    char *test[]={ "","10","0100","011000","1010","0111001" };
    int n = sizeof(test)/sizeof(char *);
    for ( int i=0; i < n; i++ ) {
        char *s = test[i];
        printf( "'%s': %d\n", s, detect_pattern3(s) );
    }
    return 0;
}