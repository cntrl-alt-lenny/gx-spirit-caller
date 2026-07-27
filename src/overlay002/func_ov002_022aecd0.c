/* func_ov002_022aecd0: save arg(r4). func_ov002_022598d0(arg1). If global
 * data_022d0f2c.f_c8 != 0 -> func_ov002_0229a414(0). Then
 * func_ov002_022ae9c0(arg0,0); finally func_02037208(0x3a,-1,0,1)
 * (0x3a, 0x3a-0x3b=-1, 0, 1). */

struct G022d0f2c_c8 {
    char _pad0[0xc8];
    int  f_c8;
};
extern struct G022d0f2c_c8 data_ov002_022d0f2c;

extern void func_ov002_022598d0(int a);
extern void func_ov002_0229a414(int a);
extern void func_ov002_022ae9c0(void *p, int v);
extern int func_02037208(int a, int b, int c, int d);

int func_ov002_022aecd0(void *p, int a) {
    func_ov002_022598d0(a);
    if (data_ov002_022d0f2c.f_c8 != 0)
        func_ov002_0229a414(0);
    func_ov002_022ae9c0(p, 0);
    return func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
}
