typedef struct Obj { char pad[8]; int f8; int fc; } Obj;
extern int func_0206e4a4(int param0);
extern int func_02093808(void); /* Assembly wrapper returns processor mode in r0. */
extern int func_0209268c(Obj *o);
extern void func_020927b8(char *self);
extern void func_02092748(void *self);
extern int func_0206d148(void *self, int u1, int u2, int u3, int a5, int a6, int flags);
static inline int is_valid(void *self) {
    int valid = 0;
    if (self) valid = ((*(short *)((char *)self + 0x70) & 1) != 0);
    return valid;
}
int func_0206d1f0(void *self, int a, int b, int c, int d, int flags) {
    char *p;
    int mode;
    int ret;
    int valid;
    int special;
    if (func_0206e4a4((int)self)) return -28;
    if ((flags & 4) || *(signed char *)((char *)self + 0x72) == 0) {
        if (*(signed char *)((char *)self + 0x73) == 4) return -28;
        mode = 0;
    } else {
        if (func_02093808() == 18) return -28;
        mode = 1;
    }
    valid = is_valid(self);
    if (valid == 0) return -39;
    special = 1;
    if (*(signed char *)((char *)self + 0x73) != 0 && *(signed char *)((char *)self + 0x73) != 4) special = 0;
    if (special) {
        if (!(*(volatile short *)((char *)self + 0x70) & 4) || (*(volatile short *)((char *)self + 0x70) & 8)) return -56;
    }
    p = *(char **)((char *)self + 0x64);
    if (!(mode & 1)) {
        if (!func_0209268c((Obj *)(p + 0xe0))) return -6;
    } else {
        func_020927b8(p + 0xe0);
    }
    ret = func_0206d148(self, a, b, c, d, mode, flags);
    func_02092748(p + 0xe0);
    return ret;
}





