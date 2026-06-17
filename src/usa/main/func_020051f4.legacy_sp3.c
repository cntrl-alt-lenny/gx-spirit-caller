/* func_020051f4: family 6 sibling (different fnptr + helper). */
extern int func_02003efc(int x, int y, int z);
extern int func_02004ed8(int a, int b, int c, int d, int e, int f, void *g);

void func_020051f4(int a, int b, int c, int d, int e, int f) {
    func_02004ed8(a, b, c, d, e, f, (void *)func_02003efc);
}
