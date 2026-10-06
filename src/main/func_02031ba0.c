typedef struct node_02031ba0 node_02031ba0_t;

struct node_02031ba0 {
    node_02031ba0_t *prev;
    node_02031ba0_t *next;
    void           (*on_remove)(node_02031ba0_t *n);
    int            (*check)(node_02031ba0_t *n);
    char             _pad[0x1c];
    unsigned int     flags;
};

typedef struct {
    char _pad[0x10];
    void (*default_remove)(node_02031ba0_t *n);
} state_02031ba0_t;

extern state_02031ba0_t data_0219adb8;

node_02031ba0_t *func_02031ba0(node_02031ba0_t *n) {
    node_02031ba0_t *next;
    node_02031ba0_t *prev;
    unsigned int flags;
    int r;

    n->on_remove = data_0219adb8.default_remove;
    r = 0;
    next = n->next;
    prev = n->prev;
    flags = n->flags;
    if (n->check != 0) {
        r = n->check(n);
    }
    if ((flags & 0x8000) && r == 1) {
        return next;
    }
    prev->next = next;
    next->prev = prev;
    if (!(flags & 0x4000) && n->on_remove != 0) {
        n->on_remove(n);
    }
    return next;
}
