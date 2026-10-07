extern int func_020952d0(void);
extern int func_020952e4(void);
extern void func_020928e8(void *ptr, int size);

typedef struct Node {
    int f0;
    struct Node *next;
    char pad[0x10];
    void *link;
} Node;

typedef struct {
    Node *head;
    void *tail;
} Slot;

typedef struct {
    char pad[0x18];
    Slot slot[1];
} Obj;

void func_0209614c(Obj *o, int i, Node *t) {
    Slot *slot;
    Node *head;
    Node *n;
    func_020952e4();
    head = o->slot[i].head;
    if (head != 0) {
        if (t == head) {
            func_020952d0();
            return;
        }
        slot = &o->slot[i];
        n = head->link;
        if ((Node *)slot == n) {
            head->link = o->slot[i].tail;
            func_020928e8(o->slot[i].head, 0x3c);
        } else {
            if (n != 0) {
                do {
                    Node *nx = n->next;
                    if ((Node *)slot == nx) break;
                    n = nx;
                } while (n != 0);
            }
            n->next = o->slot[i].tail;
            func_020928e8(n, 8);
        }
    }
    {
        void *old = t->link;
        t->link = &o->slot[i];
        o->slot[i].tail = old;
        o->slot[i].head = t;
    }
    func_020952d0();
    func_020928e8(o, 0x3c);
    func_020928e8(t, 0x3c);
}
