#pragma thumb on
extern char data_ov004_022913ec[];
extern char data_ov004_022913ee[];
extern int func_ov004_021dbf14(void *data, int len);
extern void *func_ov004_021de03c(int n);
extern void func_ov004_021de028(void *p);
extern int func_ov004_021dba78(void);
extern void func_ov004_021dbc54(void *p, void *q, int n);
extern void func_ov004_021dbfb8(void *state, void *key, int keylen, int N);
extern void func_ov004_021dbf88(void *ctx, void *dst, void *src, int len);
int func_ov004_021dc0b8(unsigned char *arg0, void *arg1, int arg2, unsigned char *arg3, void *arg4, void *arg5, int arg6) {
    int state[4];
    short tmp;
    arg3[0] = func_ov004_021dbf14(arg0, arg2);
    state[2] = (int)func_ov004_021de03c(arg2);
    if (state[2] == 0) return -1;
    tmp = func_ov004_021dba78();
    func_ov004_021dbc54(arg4, &tmp, 2);
    func_ov004_021dbc54(data_ov004_022913ec, arg4, 2);
    func_ov004_021dbc54(data_ov004_022913ee, arg5, arg6);
    func_ov004_021dbfb8(state, data_ov004_022913ec, arg6 + 2, arg2);
    func_ov004_021dbf88(state, arg1, arg0, arg2);
    func_ov004_021de028((void *)state[2]);
    return 0;
}
