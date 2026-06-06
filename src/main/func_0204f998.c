/* func_0204f998: if func_020498f0() is null return 0; set a0->f0 = it + 0x2d0;
 * return its f13 byte + 1. (Re-calls the accessor each use.) */
extern unsigned char *func_020498f0(void);
int func_0204f998(int *a0){
    if (!func_020498f0()) return 0;
    *a0 = (int)(func_020498f0() + 0x2d0);
    return func_020498f0()[13] + 1;
}
