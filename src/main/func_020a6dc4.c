struct S6d94 {
    int f0;
    unsigned unused:12;
    unsigned flag:1;
    unsigned rest:19;
    int f8, f12, f16, f20, f24, f28, f32, f36, f40, f44, f48, f52, f56, f60;
    int (*f64)(int, int, int *, int);
    int f68, f72;
};
extern void func_020a6d90(int, int *);
extern void func_020a6d94(struct S6d94 *p);
int func_020a6dc4(struct S6d94 *p, int *out) {
    int n = p->f36 - p->f28;
    if (n != 0) {
        int result;
        p->f40 = n;
        if (p->flag == 0)
            func_020a6d90(p->f28, &p->f40);
        result = p->f64(p->f0, p->f28, &p->f40, p->f72);
        if (out != 0)
            *out = p->f40;
        if (result != 0)
            return result;
        p->f24 += p->f40;
    }
    func_020a6d94(p);
    return 0;
}
