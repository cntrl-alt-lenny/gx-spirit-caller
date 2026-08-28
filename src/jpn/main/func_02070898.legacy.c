typedef unsigned char u8;

struct S0980 {
    char _pad0[0x8];
    u8 f_8;
    char _pad1[0x33];
    int f_3c;
    int f_40;
    int f_44;
};

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int save);
extern void func_0207229c(struct S0980 *s, int code);
extern void func_020a7294(int a, int b);

void func_02070898(int arg0, struct S0980 *s) {
    int saved = OS_DisableIrq();
    int cur = s->f_44;
    int cond = 0;

    if (cur == s->f_3c) {
        if (arg0 != 0) cond = 1;
    }
    if ((unsigned)arg0 >= (unsigned)cur) {
        s->f_44 = 0;
    } else {
        int base = s->f_40;
        cur -= arg0;
        s->f_44 = cur;
        func_020a7294(base, base + arg0);
    }
    OS_RestoreIrq(saved);

    if (s->f_8 == 0xa) return;
    if (s->f_8 == 0xb) return;
    if (s->f_44 != 0 && cond == 0) return;
    func_0207229c(s, 0x1b);
}
