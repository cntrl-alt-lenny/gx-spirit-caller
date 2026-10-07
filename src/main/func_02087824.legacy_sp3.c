typedef unsigned char u8;

struct List { int head; int tail; };
struct Node { int pad0; struct List *list; char pad8[0x35]; u8 prio; };

extern struct Node *func_0207cfdc(struct List *l, struct Node *prev);
extern void func_0207d05c(struct List *l, struct Node *at, struct Node *n);

void func_02087824(struct List *l, struct Node *n)
{
    struct Node *p = func_0207cfdc(l, 0);
    if (p != 0) {
        do {
            if (n->prio < p->prio) {
                break;
            }
            p = func_0207cfdc(l, p);
        } while (p != 0);
    }
    func_0207d05c(l, p, n);
    n->list = l;
}
