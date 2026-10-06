typedef struct node_02031ab0 {
    struct node_02031ab0 *prev;
    struct node_02031ab0 *next;
    char                  _pad[0x24];
    unsigned int          key;
} node_02031ab0_t;

extern void func_02093bfc(void);

void func_02031ab0(node_02031ab0_t *head, node_02031ab0_t *n) {
    node_02031ab0_t *p = head;
    unsigned int key = n->key;

    do {
        p = p->next;
        if ((p->key >> 24) >= (key >> 24)) {
            p->prev->next = n;
            n->next = p;
            n->prev = p->prev;
            p->prev = n;
            return;
        }
    } while (p != head);
    func_02093bfc();
}
