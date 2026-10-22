typedef struct {
    unsigned short f0, f2;
    int f4;
    unsigned int f8;
    int fc;
    int f10;
    void *f14;
} Hdr;
extern void func_0207f87c(int *base, int idx, int value);
extern void func_02092904(void *p, int n);
extern void func_02090330(void);
extern void func_0209015c(void);
extern void func_020901cc(void *p, int a, int n);
extern void func_0208fd90(void *p, int a, int n);
extern void func_0208fd30(void *p, int a, int n);
void func_0207f610(Hdr *h, int a, int mode, int *out) {
    unsigned int flags = h->f8;
    int v;
    switch (mode) {
    case 0: break;
    case 1:
        *(unsigned int *)0x04000000 = (*(unsigned int *)0x04000000 & 0xffcfffef) | flags;
        break;
    case 2:
        *(unsigned int *)0x04001000 = (*(unsigned int *)0x04001000 & 0xffcfffef) | flags;
        break;
    }
    func_02092904(h->f14, h->f10);
    switch (mode) {
    case 0:
        func_02090330();
        func_020901cc(h->f14, a, h->f10);
        func_0209015c();
        break;
    case 1:
        func_0208fd90(h->f14, a, h->f10);
        break;
    case 2:
        func_0208fd30(h->f14, a, h->f10);
        break;
    }
    if (h->f8 == 0) {
        switch (h->f2) {
        case 1: v = 0; break;
        case 2: v = 1; break;
        case 4: v = 2; break;
        case 8: v = 3; break;
        case 16: v = 4; break;
        case 32: v = 5; break;
        default: v = 0; break;
        }
        out[3] = v;
        switch (h->f0) {
        case 1: v = 0; break;
        case 2: v = 1; break;
        case 4: v = 2; break;
        case 8: v = 3; break;
        case 16: v = 4; break;
        case 32: v = 5; break;
        default: v = 0; break;
        }
        out[4] = v;
    } else {
        out[3] = h->f2;
        out[4] = h->f0;
    }
    out[5] = h->f4;
    out[6] = 0;
    out[7] = 1;
    out[8] = h->f8;
    func_0207f87c(out, mode, a);
}
