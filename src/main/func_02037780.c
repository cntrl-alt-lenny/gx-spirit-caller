typedef struct S0203624c {
    char pad00[0x5c];
    struct S0203624c *f5c;
    char pad60[8];
    unsigned short flags;
    signed char f6a;
} Node;
typedef struct {
    char pad00[4];
    short current;
    char pad06[6];
    unsigned short status;
    char pad0e[4];
    unsigned short flags;
} Manager;
extern Manager data_0219b2e0;
extern Node *data_0219b344[];
extern void func_0203624c(struct S0203624c *p, int v);
extern Node *func_02037414(int a, int b, int c, int d, int e);
Node *func_02037780(int a, int b, int c, int d, int e, int f) {
    int flags;
    Node *q;
    int link;
    Node *p;
    if (!(data_0219b2e0.flags & 0x8000)) return 0;
    if (b >= 0 && !(c & 0x8000)) link = 1;
    else link = 0;
    flags = f;
    if (link && data_0219b2e0.current >= 0) flags |= 0x40;
    if (data_0219b2e0.current >= 0) {
        q = data_0219b344[data_0219b2e0.current];
        if ((q->flags & 0x200) && q->f5c != 0) {
            func_0203624c(q->f5c, -1);
            q->f5c = 0;
        }
    }
    p = func_02037414(a, c, d, e, flags);
    if (!p) return 0;
    if (link && !(data_0219b2e0.status & 0x80)) {
        q = func_02037414(-b, 0x2601, d, e, 0xa0);
        if (!q) return q;
        p->flags |= 0x100;
        p->f5c = q;
        q->flags |= 0x200;
        q->f5c = p;
        return q;
    }
    return p;
}



