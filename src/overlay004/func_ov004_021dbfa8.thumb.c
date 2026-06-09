#pragma thumb on
extern int func_020b3870(int a, int b);
void func_ov004_021dbfa8(signed char *key, unsigned char *buf, int len) {
    int n = func_020b3870(len, 2);
    int i;
    for (i = 0; i < n; i++)
        buf[n + i] ^= key[i];
}
