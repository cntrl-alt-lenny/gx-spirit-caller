#pragma thumb on
extern int func_020b377c(int a, int b);
void func_ov004_021dbd94(signed char *key, unsigned char *buf, int len) {
    int n = func_020b377c(len, 2);
    int i;
    for (i = 0; i < n; i++)
        buf[n + i] ^= key[i];
}
