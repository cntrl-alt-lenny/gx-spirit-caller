struct S {
    int f0;
    char pad4[0x78];
    int f7c;
    int f80;
    char pad84[0x400];
    int f484;
    char pad488[0x28];
    int f4b0;
};
/* Original caller supplies only r0 despite the four-argument callee definition. */
extern int func_020453b4();
extern int func_02054e70(int unused0);
extern void func_0206aacc(struct S *p);
extern void func_0206ab3c(struct S *p);
void func_0206aa68(struct S *p) {
    if (p->f7c != 0) func_020453b4(p->f7c);
    p->f7c = 0;
    p->f80 = 0;
    if (p->f4b0 != -1) func_02054e70(p->f4b0);
    p->f4b0 = -1;
    p->f0 = 1;
    func_0206aacc(p);
    p->f484 = -1;
    func_0206ab3c(p);
}

