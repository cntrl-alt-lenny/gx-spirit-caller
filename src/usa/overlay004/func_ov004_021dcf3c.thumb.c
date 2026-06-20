#pragma thumb on
extern unsigned func_ov004_021dbb08(int x);
extern int func_ov004_021dcb50(void *p);
extern int func_ov004_021dce2c(int a, char *b, int *c, int d);
extern int func_ov004_021dcd24(int a, char *b, int *c, int d);
extern int func_ov004_021dcc60(int a, char *b, int *c, int d);
int func_ov004_021dcf3c(int arg0, char *arg1, int *arg2, int arg3) {
    char *rec = arg1 + 12;
    if (func_ov004_021dbb08(*(unsigned short *)(arg1 + 12)) < 1) { arg2[0]++; return arg0; }
    if (*(unsigned char *)(rec + 15) != 17) { arg2[0]++; return arg0; }
    if (func_ov004_021dcb50(arg1 + 12) > 0) { arg2[0]++; return arg0; }
    switch (func_ov004_021dbb08(*(unsigned short *)(rec + 6))) {
    case 0x1010: arg0 = func_ov004_021dce2c(arg0, arg1, arg2, arg3); break;
    case 0x2010: arg0 = func_ov004_021dcd24(arg0, arg1, arg2, arg3); break;
    case 0x3010: arg0 = func_ov004_021dcc60(arg0, arg1, arg2, arg3); break;
    }
    return arg0;
}
