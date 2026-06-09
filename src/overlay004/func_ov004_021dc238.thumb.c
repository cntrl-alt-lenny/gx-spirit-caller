#pragma thumb on
extern char data_ov004_0229164c[];
extern char data_ov004_0229164e[];
extern void *func_ov004_021de250(int n);
extern void func_ov004_021de23c(void *p);
extern void func_ov004_021dd590(int x);
extern void func_ov004_021dbe68(void *p, void *q, int n);
extern void func_ov004_021dc1cc(void *state, void *key, int keylen, int N);
extern void func_ov004_021dc19c(void *ctx, void *dst, void *src, int len);
extern int func_ov004_021dc128(void *data, int len);
int func_ov004_021dc238(unsigned char *arg0, void *arg1, int arg2, int arg3, void *arg4, void *arg5, int arg6) {
    int state[4];
    int crc;
    state[2] = (int)func_ov004_021de250(arg2);
    if (state[2] == 0) {
        func_ov004_021dd590(2);
        return -1;
    }
    func_ov004_021dbe68(data_ov004_0229164c, arg4, 2);
    func_ov004_021dbe68(data_ov004_0229164e, arg5, arg6);
    func_ov004_021dc1cc(state, data_ov004_0229164c, arg6 + 2, arg2);
    func_ov004_021dc19c(state, arg1, arg0, arg2);
    crc = func_ov004_021dc128(arg1, arg2);
    if (crc != arg3) {
        func_ov004_021dd590(18);
        func_ov004_021de23c((void *)state[2]);
        return -1;
    }
    func_ov004_021de23c((void *)state[2]);
    return 0;
}
