typedef struct {
    char pad0[0x2c];
    unsigned char arr[0x14];
    int count;
} T_02067b8c;
extern void func_02067b8c(T_02067b8c *p, unsigned char value);
extern void func_02055324(void *p);
extern int func_02068d0c(char *p);
extern int func_0206ab88(void *p, const char *s, const char *t, int flags, int arg);
extern int func_020a978c(char *dst, const char *format, ...);
extern int func_020aaddc(const char *s);
extern const char *data_02101928[];
extern const char data_02101d80[];

int func_02068e24(char *self, int async, int value, unsigned char *items, int count, const char *text, int flags, int arg) {
    char buffer[0x100] = {0};
    int used = 0;
    int i = 0;
    int result;
    *(int *)(self + 0x620) = value;
    *(int *)(self + 0x40) = 0;
    for (; i < count; i++) {
        const char *s = data_02101928[items[i]];
        if (used + func_020aaddc(s) + 1 >= 0x100) break;
        used += func_020a978c(buffer + used, data_02101d80, s);
        func_02067b8c((T_02067b8c *)self, items[i]);
    }
    result = func_0206ab88(self + 0x4c, buffer, text, flags, arg);
    if (result != 0) return result;
    if (async != 0) return result;
    {
        int status = result;
        while (*(int *)(self + 0x4c) == 3 || (*(int *)(self + 0x10) > 0 && status == 0)) {
            func_02055324((void *)10);
            status = func_02068d0c(self);
        }
        return status;
    }
}

