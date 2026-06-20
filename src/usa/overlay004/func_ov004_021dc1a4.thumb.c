#pragma thumb on
extern int func_ov004_021dbb58(int x);
extern void func_ov004_021dbc54(void *p, void *q, int n);
void func_ov004_021dc1a4(short *out, int arg1, int arg2, int arg3, signed char arg4, signed char arg5, void *arg6) {
    out[0] = func_ov004_021dbb58(1);
    out[1] = 0;
    out[2] = 0;
    out[3] = func_ov004_021dbb58((unsigned short)arg1);
    out[4] = 0;
    out[5] = func_ov004_021dbb58((unsigned short)arg2);
    out[6] = func_ov004_021dbb58((unsigned short)arg3);
    ((signed char *)out)[14] = arg4;
    ((signed char *)out)[15] = arg5;
    func_ov004_021dbc54((char *)out + 16, arg6, 8);
}
