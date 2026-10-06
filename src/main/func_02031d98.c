typedef struct node_02031d98 node_02031d98_t;

struct node_02031d98 {
    node_02031d98_t *prev;
    node_02031d98_t *next;
    void           (*on_run)(node_02031d98_t *n);
    char             _pad[0x20];
    unsigned int     flags;
};

typedef struct {
    node_02031d98_t  head;
    node_02031d98_t  pending;
    unsigned int     mask;
} queue_02031d98_t;

typedef struct {
    node_02031d98_t *cursor;
    char             _pad4[0x4];
    unsigned int     mask;
    char             _pad[0x4bc];
    node_02031d98_t *idle_next;
} state_02031d98_t;

extern state_02031d98_t data_0219adb8;
extern queue_02031d98_t data_0219adcc[];
extern node_02031d98_t data_0219b27c;
extern void func_020318a4(node_02031d98_t *n);
extern void func_02031ab0(queue_02031d98_t *q, node_02031d98_t *n);
extern node_02031d98_t *func_02031ba0(node_02031d98_t *n);

void func_02031d98(void) {
    queue_02031d98_t *q2;
    queue_02031d98_t *q;
    node_02031d98_t *n;
    node_02031d98_t *next;
    int i;

    q2 = data_0219adcc;
    q = q2;
    for (i = 0; i < 0xc; i++, q++) {
        n = q->pending.next;
        while (n != &q->pending) {
            next = n->next;
            func_02031ab0(q, n);
            n = next;
        }
        func_020318a4(&q->pending);
    }

    for (i = 0; i < 0xc; i++, q2++) {
        if (q2->mask & data_0219adb8.mask) {
            continue;
        }
        n = q2->head.next;
        while (n != &q2->head) {
            if (n->flags & 0x30) {
                n = n->next;
            } else {
                data_0219adb8.cursor = n->next;
                if (n->on_run != 0) {
                    n->on_run(n);
                }
                n = data_0219adb8.cursor;
            }
        }
    }

    n = data_0219adb8.idle_next;
    while (n != &data_0219b27c) {
        n = func_02031ba0(n);
    }
}
