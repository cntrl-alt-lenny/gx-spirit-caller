extern int func_0209dc30(void);
extern void func_0209de5c(int, int);
/* The original passes trailing record words beyond the callee's four named parameters. */
extern int func_0209dd30(int, unsigned short, int, int, ...);
int func_020a06b0(int a, int b, int c, int d, unsigned short e) {
 int r = func_0209dc30();
 if (r != 0) return r;
 func_0209de5c(0x1d, a);
 r = func_0209dd30(0x1d, 4, b, c, d, e);
 return r == 0 ? 2 : r;
}
