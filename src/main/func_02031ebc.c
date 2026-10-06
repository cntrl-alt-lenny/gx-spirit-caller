typedef struct node_02031ebc {
    struct node_02031ebc *prev;
    struct node_02031ebc *next;
    char                  _pad8[0x8];
    unsigned int          flags;
    char                  _pad14[0x8];
    void                 *extra;
} node_02031ebc_t;

typedef struct {
    char             _pad[0x8];
    node_02031ebc_t *head;
    node_02031ebc_t *tail;
} list_02031ebc_t;

extern void func_02032014(list_02031ebc_t *l, void *p);

void func_02031ebc(list_02031ebc_t *l, node_02031ebc_t *n) {
    if (n->prev != 0) {
        n->prev->next = n->next;
    } else if (l->head == n) {
        l->head = n->next;
    }
    if (n->next != 0) {
        n->next->prev = n->prev;
    } else if (&l->tail != 0 && l->tail == n) {
        l->tail = n->prev;
    }
    if (!(n->flags & 1)) {
        func_02032014(l, n->extra);
    }
    func_02032014(l, n);
}
