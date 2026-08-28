extern void func_02001ed4(void *p, int x, int y);
extern int func_02004ed8(int a, int b, int c, int d, int e, int f, void *fn);
extern int func_02003af8(void);
extern int func_02003aa0(void);

void func_02004fcc(void *a, int b, int c, int d, int e, int f) {
    func_02001ed4(a, 0, 0);
    func_02004ed8((int)a, b, c, d + 1, e + 1, f, func_02003af8);
    func_02001ed4(a, 1, 1);
    func_02004ed8((int)a, b, c, d, e, f, func_02003aa0);
}
