typedef struct Node_0200fa90 Node_0200fa90;
struct Node_0200fa90 {
    Node_0200fa90 *next;
    Node_0200fa90 *prev;
    int f8;
    unsigned int key;
};

Node_0200fa90 *func_0200fa90(Node_0200fa90 *n, Node_0200fa90 *at) {
    Node_0200fa90 *cur = at->next;

    if (cur != 0) {
        unsigned int k = n->key >> 12;
        do {
            if (k < (cur->key >> 12)) {
                break;
            }
            at = cur;
            cur = cur->next;
        } while (cur != 0);
    }
    if (at != 0) {
        if (n != at) {
            n->prev = at;
            n->next = at->next;
            at->next = n;
        }
        if (n->next != 0) {
            n->next->prev = n;
        }
        return n;
    }
    return 0;
}
