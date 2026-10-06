typedef struct Node02067c58 Node02067c58;
struct Node02067c58 {
    char          _0[0x15];
    unsigned char flags;
    char          _16[0x6];
    unsigned int  time;
    char          _20[0x4];
};

typedef struct {
    Node02067c58 *head;
    Node02067c58 *tail;
    int           count;
} List02067c58;

typedef struct obj_02067c58 obj_02067c58_t;

struct obj_02067c58 {
    char          _0[0x8];
    List02067c58  list;
    char          _14[0x30];
    void        (*cb)(obj_02067c58_t *o, int ev, Node02067c58 *n, int arg);
    int           arg;
};

extern unsigned int func_02055330(void);
extern Node02067c58 *func_020683ec(List02067c58 *list);

void func_02067c58(obj_02067c58_t *o) {
    unsigned int now = func_02055330();
    Node02067c58 *n;

    while ((n = o->list.head) != 0) {
        if (now <= n->time + 2500) {
            return;
        }
        n->flags |= 0x10;
        o->list.head->time = 2500;
        o->list.head->flags &= 0xd3;
        o->cb(o, 1, o->list.head, o->arg);
        func_020683ec(&o->list);
    }
}
