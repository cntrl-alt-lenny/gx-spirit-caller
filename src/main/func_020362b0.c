typedef struct S0203624c {
    char pad00[0x1c];
    unsigned short f1c;
    char pad1e[4];
    short f22;
    char pad24[10];
    unsigned char f2e, f2f, f30;
    char pad31[3];
    int f34;
    char pad38[4];
    unsigned int f3c;
    char pad40[0x1c];
    struct S0203624c *f5c;
    char pad60[8];
    unsigned short flags;
    signed char f6a;
    char f6b;
    unsigned char f6c;
    char f6d, f6e;
    signed char f6f;
} Node;
typedef struct { char pad00[4]; short current; } Manager;
typedef struct {
    char _pad[0x68]; unsigned short flags; signed char state; char _6b[0xd];
} ent_02037328_t;
extern Node *data_0219b344[];
extern Manager data_0219b2e0;
extern void func_0203624c(struct S0203624c *p, int v);
extern Node *func_02036d7c(int a, int b, int c, unsigned int d);
extern void func_02036c68(void);
extern void func_0203724c(void);
extern int func_02037328(ent_02037328_t *self);
extern Node *func_02037780(int a, int b, int c, int d, int e, int f);
extern int func_020382d8(Node *p, int a, int b, int c, int d);
void func_020362b0(void) {
    Node *p;
    int i, count;
    Node *replace, *pending, *linked;

    for (;;) {
        linked = 0;
        pending = 0;
        replace = 0;
        count = 0;
        for (i = 0; i < 4; i++) {
            p = data_0219b344[i];
            if (p) {
                if (p->flags & 0x3003) {
                    if (p->flags & 0x2000) replace = p;
                    if (p->flags & 0x1000) {
                        if (!pending || p->f6f > pending->f6f) pending = p;
                    }
                } else {
                    if (!(p->flags & 0x200)) count++;
                    else linked = p;
                }
            }
        }
        if (count > 0) return;
        if (replace) {
            Node *result;
            int slot = replace->f6c;
            result = func_02036d7c(replace->f34, slot | 0x8000, replace->f1c, replace->f3c & ~0x6000);
            if (result) {
                if (replace != result) func_0203624c(replace, 0);
                if (!linked) {
                    data_0219b2e0.current = slot;
                    data_0219b344[slot] = result;
                }
                func_0203724c();
                func_02036c68();
                return;
            }
            if (func_02037328(0)) return;
            func_0203624c(replace, 0);
        } else {
            if (!pending) return;
            func_020382d8(pending, 0, pending->f2e, pending->f30, pending->f2f);
            pending->flags &= ~0x1000;
            func_0203724c();
            if (pending->f22 >= 0) {
                Node *p = func_02037780(pending->f22, -1, 0x2601, 0, pending->f2f, 0xa0);
                if (p) {
                    pending->flags |= 0x100;
                    p->flags |= 0x200;
                }
                pending->f22 = -1;
            }
            func_02036c68();
            return;
        }
    }
}




