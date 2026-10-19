typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
extern Req data_ov008_021b23c0;
extern Req data_ov008_021b23d0;
typedef struct { int f0, f4, f8; int pad[11]; Out out; } Obj;
extern Obj data_ov008_021b2d34;
extern Obj data_ov008_021b2d74;
extern void func_0201e7e0();
extern void func_0201ef90(int *a0, int *a1, int *a2, int a3, int s0, int s1, Req *r, int s3, int s4, Out *out);
void func_ov008_021ab3ac(void) {
    Req a = data_ov008_021b23c0;
    Req b = data_ov008_021b23d0;
    int p = (int)&data_ov008_021b2d34;
    func_0201e7e0();
    func_0201ef90((int *)p, (int *)(p+4), (int *)(p+8), 0x100, 0x400, 2, &a, 1, 0x200, (Out *)(p+0x38));
    p = (int)&data_ov008_021b2d74;
    func_0201e7e0();
    func_0201ef90((int *)p, (int *)(p+4), (int *)(p+8), 0xf900, 0x40, 2, &b, 0, 0x20, (Out *)(p+0x38));
}


