/* func_ov002_022aeb94: save arg(r4). func_ov002_022597e8(arg1). If global
 * data_022d0f2c.f_c8 != 0 -> func_ov002_0229a304(0). Then
 * func_ov002_022ae884(arg0,0); finally func_020371b8(0x3a,-1,0,1)
 * (0x3a, 0x3a-0x3b=-1, 0, 1). */

struct G022d0f2c_c8 {
    char _pad0[0xc8];
    int  f_c8;
};
extern struct G022d0f2c_c8 data_ov002_022d0e4c;

extern void func_ov002_022597e8(int a);
extern void func_ov002_0229a304(int a);
extern void func_ov002_022ae884(void *p, int v);
extern int func_020371b8(int a, int b, int c, int d);

int func_ov002_022aeb94(void *p, int a) {
    func_ov002_022597e8(a);
    if (data_ov002_022d0e4c.f_c8 != 0)
        func_ov002_0229a304(0);
    func_ov002_022ae884(p, 0);
    return func_020371b8(0x3a, 0x3a - 0x3b, 0, 1);
}
