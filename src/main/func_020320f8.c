typedef struct node_020320f8 {
    struct node_020320f8 *prev;
    struct node_020320f8 *next;
    int                   id;
    unsigned short        a;
    unsigned short        b;
    int                   c;
    int                   field_14;
    int                   d;
    int                   e;
    int                   f;
} node_020320f8_t;

typedef struct {
    int              counter;
    int              _pad4;
    node_020320f8_t *head;
    node_020320f8_t *tail;
} list_020320f8_t;

extern node_020320f8_t *func_02032028(list_020320f8_t *l, int size);

int func_020320f8(list_020320f8_t *l, int a, int b, int c, int d, int e, int f) {
    node_020320f8_t *n;

    if (l == 0) {
        return -1;
    }
    n = func_02032028(l, sizeof(node_020320f8_t));
    if (n == 0) {
        return -1;
    }
    n->id = l->counter;
    n->a = a;
    n->b = b;
    n->c = c;
    n->field_14 = 0;
    n->d = d;
    n->e = e;
    n->f = f;
    n->prev = 0;
    n->next = l->head;
    if (l->head != 0) {
        l->head->prev = n;
    }
    l->head = n;
    if (&l->tail != 0 && l->tail == 0) {
        l->tail = n;
    }
    l->counter++;
    if (l->counter == -1) {
        l->counter++;
    }
    return n->id;
}
