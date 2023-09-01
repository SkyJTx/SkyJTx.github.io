#include <stdio.h>
#include <stdlib.h> // for malloc()

typedef struct node node_t;

// The data struture 'node_t' is used to implement a linked list.
struct node {
    int value;
    node_t *next;
};

// This function shows the value of each node in the linked list.
void print_nodes_in_sequence( node_t *head ) {
    node_t *p = head;
    while( p ) {
        printf( "node (value=%d)\n", p->value );
        p = p->next;
    }
}

// This function counts the number of nodes in the linked list
int count_nodes( node_t *head ) {
    node_t *p = head;
    int count = 0;
    while ( p ) {
        count++;
        p = p->next;
    }
    return count;
}

// head - points to the head node in the linked list.
// value - specifies the value used to create in a new node.
node_t *append_node( node_t *head, int value ) {
    node_t *new_node = (node_t*)malloc(sizeof(node_t));
    new_node->value = value;
    new_node->next = NULL;
    if (head == NULL){
        return new_node;
    }
    node_t *original = head;
    while (head->next != NULL){
        head = head->next;
    }
    head->next = new_node;
    return original;
    // Thanks to my DoublyLinkedList implementation in python, I know how to do this.
}

int main(void) {
    int data[] = {3,1,4,2,0,5};
    node_t *head = NULL;
    // add nodes by using the numbers in the data array as values.
    for (int i=0; i < sizeof(data)/sizeof(int); i++ ) {
        head = append_node( head, data[i] );
    }
    printf( "Number of nodes: %d\n", count_nodes(head) );
    print_nodes_in_sequence( head );
    return 0;
}