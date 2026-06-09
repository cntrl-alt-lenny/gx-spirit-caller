#pragma thumb on
extern char data_ov004_0229164c[];
extern char data_ov004_0229164e[];
extern int func_ov004_021dc128(void *data, int len);
extern void *func_ov004_021de250(int n);
extern void func_ov004_021de23c(void *p);
extern int func_ov004_021dbc8c(void);
extern void func_ov004_021dbe68(void *p, void *q, int n);
extern void func_ov004_021dc1cc(void *state, void *key, int keylen, int N);
extern void func_ov004_021dc19c(void *ctx, void *dst, void *src, int len);
int func_ov004_021dc2cc(unsigned char *arg0, void *arg1, int arg2, unsigned char *arg3, void *arg4, void *arg5, int arg6) {
    int state[4];
    short tmp;
    arg3[0] = func_ov004_021dc128(arg0, arg2);
    state[2] = (int)func_ov004_021de250(arg2);
    if (state[2] == 0) return -1;
    tmp = func_ov004_021dbc8c();
    func_ov004_021dbe68(arg4, &tmp, 2);
    func_ov004_021dbe68(data_ov004_0229164c, arg4, 2);
    func_ov004_021dbe68(data_ov004_0229164e, arg5, arg6);
    func_ov004_021dc1cc(state, data_ov004_0229164c, arg6 + 2, arg2);
    func_ov004_021dc19c(state, arg1, arg0, arg2);
    func_ov004_021de23c((void *)state[2]);
    return 0;
}
