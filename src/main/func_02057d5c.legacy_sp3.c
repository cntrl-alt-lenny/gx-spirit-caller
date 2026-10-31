extern int func_02054140(void *p);
extern int func_02057f3c(void *ctx, int sock, int a2, int a3, int *done, int *result, char *name);
extern int func_020580a0(void *ctx, void *buf, char *data, int size);
extern void func_020a6d54(int a,int b,int c,int d);
extern char data_021001cc[], data_021000d0[], data_021001f0[];
int func_02057d5c(void *ctx, char *p, char *data, int size) {
    int total;
    int done, count;
    int ret;
    if (*(int *)(p + 0x28) == 0)
        func_020a6d54((int)data_021001cc, (int)data_021000d0, 0, 0xfb);
    total = 0;
    if (size == 0) return total;
    if (*(int *)(p + 0x30) - *(int *)(p + 0x34) == 0 && func_02054140(*(void **)(p + 0x38)) == 0) {
        do {
            ret = func_02057f3c(ctx, *(int *)(p + 8), (int)(data + total), size, &done, &count, data_021001f0);
            if (ret != 0) return ret;
            if (count != 0) {
                total += count;
                size -= count;
            }
        } while (count != 0 && size != 0);
    }
    if (size != 0) {
        ret = func_020580a0(ctx, p + 0x28, data + total, size);
        if (ret != 0) return ret;
    }
    return 0;
}
