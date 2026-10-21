extern char data_021a63d0[];
typedef struct Node { char _pad00[0x68]; struct Node *next; } Node;
void func_02092074(Node *node) {
    Node *cur;
    Node *prev = 0;
    cur = *(Node **)(data_021a63d0 + 0x8);
    while (cur != 0 && cur != node) {
        prev = cur;
        cur = cur->next;
    }
    if (prev == 0)
        *(Node **)(data_021a63d0 + 0x8) = node->next;
    else
        prev->next = node->next;
}
