extern void func_020a6d54(const char *expr, const char *file, const char *func, int line);
extern char data_020ffb10[];
extern char data_020ffb04[];

void *func_020540d0(char *s, int index) {
    if (index < 0 || index >= *(int *)s) {
        func_020a6d54(data_020ffb10, data_020ffb04, 0, 0x94);
    }
    if (index < 0 || index >= *(int *)s) {
        return 0;
    }
    return *(char **)(s + 0x14) + *(int *)(s + 0x8) * index;
}
