typedef struct Node Node;
struct Node {
    char _pad0[0xc];
    int xc;
    int x10;
    Node *next;
};

typedef struct {
    char _pad0[0x438];
    Node *head;
    Node *tail;
} Owner;

extern void func_02058334(Owner **pp, Node *n);

int func_02058244(Owner **pp, int key) {
    Owner *o = *pp;
    Node *head;
    Node *tail;
    Node *prev;
    Node *n;
    Node *next;

    if (key != 0) {
        head = o->head;
        tail = o->tail;
        prev = 0;
        o->head = 0;
        o->tail = 0;
        n = head;
        while (n != 0) {
            next = n->next;
            if (n->x10 == key || n->xc == 1) {
                if (prev != 0) {
                    prev->next = next;
                } else {
                    head = next;
                }
                if (tail == n) {
                    tail = prev;
                }
                func_02058334(pp, n);
            } else {
                prev = n;
            }
            n = next;
        }
        if (o->head != 0) {
            o->tail->next = head;
            o->tail = tail;
        } else {
            o->head = head;
            o->tail = tail;
        }
        return 0;
    }
    while ((n = o->head) != 0) {
        o->head = 0;
        o->tail = 0;
        while (n != 0) {
            next = n->next;
            func_02058334(pp, n);
            n = next;
        }
    }
    return 0;
}
