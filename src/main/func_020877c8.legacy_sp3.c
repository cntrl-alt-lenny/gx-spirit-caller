typedef unsigned char u8;

struct List { int head; int tail; };
struct Node { char pad[0x3d]; u8 prio; };

extern struct List data_021a4868;
extern struct Node *func_0207cfdc(struct List *l, struct Node *prev);
extern void func_0207d05c(struct List *l, struct Node *at, struct Node *n);

void func_020877c8(struct Node *n)
{
    struct Node *p = func_0207cfdc(&data_021a4868, 0);
    if (p != 0) {
        do {
            if (n->prio < p->prio) {
                break;
            }
            p = func_0207cfdc(&data_021a4868, p);
        } while (p != 0);
    }
    func_0207d05c(&data_021a4868, p, n);
}
