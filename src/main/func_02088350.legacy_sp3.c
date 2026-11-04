struct Slot {
    int addr;
    int zero;
};

struct S88350 {
    char         _pad00[0x20];
    int          f20;
    unsigned int f24;
    int          f28;
    int          f2c;
    int          f30;
    int          f34;
    int          f38;
    int          f3c;
    int          f40;
    char         _pad44[0x48 - 0x44];
    int          f48;
    unsigned char ch[1];
};

extern struct Slot data_021a5184[];
extern char data_021a5138[];

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int irq);
extern void func_020882d4(struct S88350 *p);
extern int  func_020b3a7c(int a, int b);
extern int  func_02087348(void);
extern void func_020880bc(struct S88350 *p, int v);
extern int func_02088170(int a, int _unused, int c, int d);
extern void func_02094e90(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j);
extern void func_02094fa0(int a, int b, int c, int (*d)(int, int, int, int), struct S88350 *e);
extern void func_0207d12c(char *a, struct S88350 *b);

int func_02088350(struct S88350 *p, int mode, int buf, int total, int a4, int a5, int a6, int a7)
{
    int tmp;
    int irq;
    int i;

    if ((((int)(p->f24 << 31)) >> 31) != 0) func_020882d4(p);

    {
        int q = func_020b3a7c(total, p->f48 * (a5 << 5));
        int x;
        q = q * a5;
        p->f28 = q << 5;
        x = p->f28;
        if (mode == 1) x = (unsigned int)x >> 1;
        tmp = func_020b3a7c(a4 * x, a5);
    }
    p->f40 = func_02087348();
    if (p->f40 < 0) return 0;

    for (i = 0; i < p->f48; i++) {
        int ch = p->ch[i];
        data_021a5184[ch].addr = buf + p->f28 * i;
        data_021a5184[ch].zero = 0;
        func_02094e90(ch, mode, data_021a5184[ch].addr, 1, 0, (unsigned int)p->f28 >> 2, 0x7f, 0, a4 << 5, 0x40);
    }

    func_02094fa0(p->f40, tmp, tmp, func_02088170, p);
    func_0207d12c(data_021a5138, p);
    p->f20 = mode;
    p->f2c = a5;
    p->f30 = a6;
    p->f34 = a7;
    p->f38 = 0;
    p->f3c = 0;
    p->f24 = (p->f24 & ~1) | 1;
    irq = OS_DisableIrq();
    p->f2c = 1;
    func_020880bc(p, 0);
    p->f2c = a5;
    OS_RestoreIrq(irq);
    return 1;
}
