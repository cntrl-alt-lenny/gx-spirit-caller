typedef struct node {
    char _pad[0x8];
    struct node *next_8;
} node_t;

void func_0209a884(node_t **head, node_t *node) {
    node_t *cur;
    node_t *prev;
    if (head == 0) return;
    cur = *head;
    prev = cur;
    while (cur != 0) {
        if (cur == node) {
            if (cur == prev) *head = cur->next_8;
            else prev->next_8 = cur->next_8;
            return;
        }
        prev = cur;
        cur = cur->next_8;
    }
}

