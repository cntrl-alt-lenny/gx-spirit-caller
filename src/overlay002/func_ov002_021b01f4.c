struct S { char pad[0xe0]; int f_e0; char pad2[0xd00 - 0xe4]; int f_d00; };
struct T { int a; int b; };
extern struct S data_ov002_022d016c;
extern struct T data_ov002_022cd73c;
extern void func_ov002_021d479c(unsigned short a, unsigned short b, unsigned short c, unsigned short d);

void func_ov002_021b01f4(int arg0) {
    int v;
    int cur;
    unsigned short z;
    if (data_ov002_022d016c.f_e0 != 0) {
        return;
    }
    data_ov002_022d016c.f_e0 = 1;
    v = 1;
    z = 0;
    cur = data_ov002_022cd73c.b;
    if (arg0 == cur) {
        v = 2;
    }
    data_ov002_022d016c.f_d00 = v;
    func_ov002_021d479c((unsigned short)((arg0 != 0 ? 0x8000 : 0) | 0x23), 0xb, z, z);
}
