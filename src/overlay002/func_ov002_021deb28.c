struct S {
    unsigned short lo;
    unsigned short b0 : 1;
    unsigned short rest : 15;
    int f1;
    int f2;
    int f3;
    int f4;
    int f5;
};

extern int func_ov002_021debe0(struct S *s, int a, int b);

void func_ov002_021deb28(int a, int b) {
    struct S s = {0};
    s.b0 = a;
    func_ov002_021debe0(&s, a, b);
}
