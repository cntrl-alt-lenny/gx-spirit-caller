typedef struct node_02031f9c {
    struct node_02031f9c *next;
    char                  _pad4[0x10];
    unsigned int          pos;
    unsigned int          limit;
} node_02031f9c_t;

typedef struct {
    char             _pad[0xc];
    node_02031f9c_t *first;
} list_02031f9c_t;

extern void func_02031f70(node_02031f9c_t *n, int a);
extern void func_02031ebc(list_02031f9c_t *l, node_02031f9c_t *n);

void func_02031f9c(list_02031f9c_t *l) {
    node_02031f9c_t *n;
    node_02031f9c_t *next;

    for (n = l->first; n != 0; n = next) {
        next = n->next;
        if (n->pos < n->limit) {
            return;
        }
        func_02031f70(n, 1);
        func_02031ebc(l, n);
    }
}
