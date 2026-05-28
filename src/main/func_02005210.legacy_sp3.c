/* func_02005210: family 6 sibling (different fnptr + helper). */
extern int func_02003f1c(int x, int y, int z);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *g);

void func_02005210(int a, int b, int c, int d, int e, int f) {
    func_02004ef4(a, b, c, d, e, f, (void *)func_02003f1c);
}
