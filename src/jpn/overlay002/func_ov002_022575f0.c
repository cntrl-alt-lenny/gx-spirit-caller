struct S022576d8 {
    char _pad[8];
    int f8;
};
extern struct S022576d8 *func_ov002_0225737c(int a);
extern int func_ov002_02257668(int a, int b);

int func_ov002_022575f0(int arg0) {
    struct S022576d8 *r = func_ov002_0225737c(arg0);
    if (r == 0 || r->f8 == 0)
        return -1;
    return func_ov002_02257668(arg0, r->f8);
}
