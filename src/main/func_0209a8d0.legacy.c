typedef struct node {
    char _pad[0x8];
    struct node *next_8;
} node_t;

void func_0209a8d0(node_t **head, node_t *new_node) {
    node_t *tail;
    node_t *next;
    if (head == 0) return;
    tail = *head;
    if (tail == 0) {
        new_node->next_8 = 0;
        *head = new_node;
        return;
    }
    next = tail->next_8;
    while (next != 0) {
        tail = next;
        next = next->next_8;
    }
    new_node->next_8 = next;
    tail->next_8 = new_node;
}
