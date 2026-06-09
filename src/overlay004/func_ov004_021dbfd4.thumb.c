#pragma thumb on
extern long long func_020b3870(int a, int b);
void func_ov004_021dbfd4(int arg0, signed char *buf, int arg2, signed char *key, int arg4) {
    int n = (int)func_020b3870(arg2, 2);
    int ki = (int)(func_020b3870(arg0, arg4) >> 32);
    int i;
    for (i = 0; i < n; i++) {
        buf[i] = i;
        buf[i] = buf[i] ^ key[ki++];
        if (ki >= arg4) ki = 0;
    }
}
