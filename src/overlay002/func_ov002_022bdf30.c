extern int Fill32(int val, void *dst, int size);
extern int func_ov002_022bdfb4(void *a, void *b);
extern int func_020059b0(void *buf, char *base, unsigned short val, int size, int (*fn)(void *, void *));
extern int data_020c7ac0;
extern char data_020c7ac4[];

typedef unsigned short u16;

char *func_ov002_022bdf30(int arg0) {
    struct { u16 a; u16 b; } local;
    char *base = data_020c7ac4;
    int result;
    Fill32(0, &local, 4);
    local.a = (u16)arg0;
    result = func_020059b0(&local, base, (u16)data_020c7ac0, 4, func_ov002_022bdfb4);
    if (result >= 0 && (unsigned int)result < (unsigned int)data_020c7ac0) {
        return base + result * 4;
    }
    return 0;
}
