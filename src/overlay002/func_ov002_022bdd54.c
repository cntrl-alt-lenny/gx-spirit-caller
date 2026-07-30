extern int Fill32(int val, void *dst, int size);
extern int func_0202bcb0(int arg0);
extern int func_ov002_022bdde0(void *a, void *b);
extern int func_020059b0(void *buf, char *base, unsigned short val, int size, int (*fn)(void *, void *));
extern int data_020c7b40[];
extern char data_020c7b44[];

typedef unsigned short u16;

char *func_ov002_022bdd54(int arg0) {
    struct { u16 a; u16 b; u16 c; u16 d; } local;
    char *base = data_020c7b44;
    int result;
    Fill32(0, &local, 8);
    local.a = (u16)func_0202bcb0(arg0);
    result = func_020059b0(&local, base, (u16)data_020c7b40[0], 8, func_ov002_022bdde0);
    if (result >= 0 && (unsigned int)result < (unsigned int)data_020c7b40[0]) {
        return base + result * 8;
    }
    return 0;
}
