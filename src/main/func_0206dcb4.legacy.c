typedef struct Container { void *head; void *f04; } Container;
typedef struct Node { struct Node *next; } Node;
typedef struct Child {
    char pad[0x100];
    int f100;
    Node *f104;
    short f108;
    char pad10a[2];
    Container f10c;
} Child;
typedef struct Object {
    char pad[0x64];
    Child *f64;
    void *f68;
    char pad6c[4];
    short f70;
    char f72;
    signed char f73;
} Object;
typedef struct Callbacks { char pad[0x1c]; void (*free)(void *); } Callbacks;
extern Callbacks *data_0219ecd8;
extern void func_0206dc04(void *a0);
extern int func_0206e550(int arg);
extern int func_0206e4ec(int arg);
extern void func_02091a0c(Container *c);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

void func_0206dcb4(Object *p) {
    int flag;
    signed char mode;
    Node *node;
    Node *next;
    int saved;
    if (p == 0) return;
    p->f70 = 0;
    mode = p->f73;
    flag = 1;
    if (mode != 0) {
        if (mode != 4) flag = 0;
    }
    if (flag != 0) {
        func_0206dc04(p->f68);
        func_0206dc04(p->f64);
    } else if (mode == 1) {
        node = p->f64->f104;
        while (node != 0) {
            next = node->next;
            data_0219ecd8->free(node);
            node = next;
        }
        p->f64->f108 = 0;
        p->f64->f100 = 0;
        p->f64->f104 = 0;
        func_02091a0c(&p->f64->f10c);
        func_0206dc04(p->f64);
    } else if (mode == 2) {
        func_0206dc04(p->f68);
    }
    saved = OS_DisableIrq();
    func_0206e550((int)p);
    func_0206e4ec((int)p);
    data_0219ecd8->free(p);
    OS_RestoreIrq(saved);
}
