struct S022576d8 {
    char _pad[8];
    int f8;
};
extern struct S022576d8 *func_ov002_02257464(int a);
extern int func_ov002_02257750(int a, int b);

int func_ov002_022576d8(int arg0) {
    struct S022576d8 *r = func_ov002_02257464(arg0);
    if (r == 0 || r->f8 == 0)
        return -1;
    return func_ov002_02257750(arg0, r->f8);
}
