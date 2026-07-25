/* func_0204f924: if func_0204987c() is null return 0; set a0->f0 = it + 0x2c8;
 * return its f13 byte + 1. (Re-calls the accessor each use.) */
extern unsigned char *func_0204987c(void);
int func_0204f924(int *a0){
    if (!func_0204987c()) return 0;
    *a0 = (int)(func_0204987c() + 0x2c8);
    return func_0204987c()[13] + 1;
}
