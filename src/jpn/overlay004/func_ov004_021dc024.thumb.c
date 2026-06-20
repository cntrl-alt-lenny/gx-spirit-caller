#pragma thumb on
extern char data_ov004_022913ec[];
extern char data_ov004_022913ee[];
extern void *func_ov004_021de03c(int n);
extern void func_ov004_021de028(void *p);
extern void func_ov004_021dd37c(int x);
extern void func_ov004_021dbc54(void *p, void *q, int n);
extern void func_ov004_021dbfb8(void *state, void *key, int keylen, int N);
extern void func_ov004_021dbf88(void *ctx, void *dst, void *src, int len);
extern int func_ov004_021dbf14(void *data, int len);
int func_ov004_021dc024(unsigned char *arg0, void *arg1, int arg2, int arg3, void *arg4, void *arg5, int arg6) {
    int state[4];
    int crc;
    state[2] = (int)func_ov004_021de03c(arg2);
    if (state[2] == 0) {
        func_ov004_021dd37c(2);
        return -1;
    }
    func_ov004_021dbc54(data_ov004_022913ec, arg4, 2);
    func_ov004_021dbc54(data_ov004_022913ee, arg5, arg6);
    func_ov004_021dbfb8(state, data_ov004_022913ec, arg6 + 2, arg2);
    func_ov004_021dbf88(state, arg1, arg0, arg2);
    crc = func_ov004_021dbf14(arg1, arg2);
    if (crc != arg3) {
        func_ov004_021dd37c(18);
        func_ov004_021de028((void *)state[2]);
        return -1;
    }
    func_ov004_021de028((void *)state[2]);
    return 0;
}
