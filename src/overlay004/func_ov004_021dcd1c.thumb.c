#pragma thumb on
/* func_ov004_021dcd1c: scan 6 bytes of data_ov004_0229161c for a nonzero;
 * if found, memcmp 6 bytes against arg1 (forwarded to func_ov004_021dbe78,
 * whose real signature is (unsigned char*,unsigned char*,int) -- arg1 here
 * is invisible from this function's own body except as a forwarded pointer
 * arg, confirmed by reading the callee). Else compare arg0 against 0x1000. */
extern unsigned char data_ov004_0229161c[];
extern int func_ov004_021dbe78(unsigned char *p0, unsigned char *p1, int count);

int func_ov004_021dcd1c(int arg0, unsigned char *arg1) {
    int result = 0;
    int i;
    int found = 0;
    for (i = 0; i < 6; i++) {
        if (data_ov004_0229161c[i] != 0) {
            found = 1;
            break;
        }
    }
    if (found) {
        if (func_ov004_021dbe78((unsigned char *)data_ov004_0229161c, arg1, 6))
            result = 1;
    } else {
        if (arg0 != 0x1000)
            result = 2;
    }
    return result;
}
