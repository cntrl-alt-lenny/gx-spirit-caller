typedef struct {
    int hdr;
    unsigned short vals[4];
} T0203a5d4;

typedef struct {
    unsigned int low24 : 24;
    unsigned int hibyte : 8;
} Packed0203a5d4;

extern T0203a5d4 *func_020892c4(int x);
extern Packed0203a5d4 *func_02089260(unsigned short id);
extern int func_02039180(int a, int b, int c, int d);
extern int func_0203953c(int a, int b, int c);

int func_0203a5d4(int a0, int a1, int a2) {
    int i;
    T0203a5d4 *t;
    t = func_020892c4(a1);
    if (t == 0) {
        return 0;
    }
    for (i = 0; i < 4; i++) {
        Packed0203a5d4 *p;
        if (t->vals[i] == 0xffff) {
            continue;
        }
        p = func_02089260(t->vals[i]);
        if (p == 0) {
            return 0;
        }
        if (p->hibyte & 1) {
            if (func_02039180(a0, a1, t->vals[i], a2) == 0) {
                return 0;
            }
        } else {
            if (func_0203953c(p->low24, 2, a2) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
