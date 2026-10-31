extern int func_020952d0(void);
extern int func_020952e4(void);
extern void func_020928e8(void *ptr, int size);
typedef struct Node {
    int f0;
    struct Node *next;
    char pad[0x10];
    struct Node *link;
} Node;
typedef struct { Node *head; Node *tail; } Slot;
typedef struct { char pad[0x18]; Slot slot[4]; } Obj;
void func_020960ac(Obj *o) {
    int i;
    Slot *slot;
    Node *head;
    Node *n;
    func_020952e4();
    slot = &o->slot[0];
    for (i = 0; i < 4; i++, slot++) {
        head = o->slot[i].head;
        if (head != 0) {
            n = head->link;
            if ((Node *)slot == n) {
                head->link = o->slot[i].tail;
                func_020928e8(head, 0x3c);
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
    }
    func_020952d0();
}
