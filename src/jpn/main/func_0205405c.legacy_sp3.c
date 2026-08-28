extern void func_020a6c60(void *a0, void *a1, int a2, int a3);
extern char data_020ffa30[];
extern char data_020ffa24[];

void *func_0205405c(char *s, int index) {
    if (index < 0 || index >= *(int *)s) {
        func_020a6c60(data_020ffa30, data_020ffa24, 0, 0x94);
    }
    if (index < 0 || index >= *(int *)s) {
        return 0;
    }
    return *(char **)(s + 0x14) + *(int *)(s + 0x8) * index;
}
