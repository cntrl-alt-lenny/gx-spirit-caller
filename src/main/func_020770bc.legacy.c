/* func_020770bc: start the transfer selected by ctx->f458 (3 or 4), then
 * run the follow-up; returns status flags (0x8000 unless f5af is set). */
typedef struct {
    unsigned char _pad_00[0x348];
    unsigned char b348[0xb4];
    unsigned char b3fc[0x5c];
    int f458;
    int f45c;
    int f460;
    int f464;
    unsigned char _pad_468[0x47c - 0x468];
    int f47c;
    unsigned char _pad_480[0x5af - 0x480];
    unsigned char f5af;
} Ctx;
extern void func_02077f8c(void *p);
extern void func_02077ecc(void *p, int a, int n);
extern void func_02077e58(void *p, void *q);
extern void func_020785cc(void *p);
extern void func_0207850c(void *p, int a, int n);
extern void func_02078498(void *p, void *q);
extern int func_02077a28(Ctx *c, void *q);
extern int func_020771bc(Ctx *c, int r);

unsigned int func_020770bc(Ctx *c) {
    unsigned int flag;
    void *p;
    int r;

    flag = c->f5af != 0 ? 0 : 0x8000;
    if (c->f45c == -1) {
        return flag | 4;
    }
    switch (c->f458) {
    case 3:
        p = c->b3fc;
        func_02077f8c(p);
        func_02077ecc(p, c->f460, c->f464 - c->f460);
        func_02077e58(p, (char *)c + 0x468);
        c->f47c = 0x10;
        break;
    case 4:
        p = c->b348;
        func_020785cc(p);
        func_0207850c(p, c->f460, c->f464 - c->f460);
        func_02078498(p, (char *)c + 0x468);
        c->f47c = 0x14;
        break;
    default:
        return flag | 3;
    }
    r = func_02077a28(c, (char *)c + 0x5b0);
    if (r == 0) {
        return flag | 1;
    }
    return flag | func_020771bc(c, r);
}
