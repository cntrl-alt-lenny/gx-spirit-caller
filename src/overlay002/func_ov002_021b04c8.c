struct S { char pad[0xe0]; int f_e0; char pad2[0xc08]; int f_cec; char pad3[0x10]; int f_d00; char pad4[8]; int f_d0c; };
struct T { int a; int b; };
struct P { int result; char pad[0x864]; };
extern struct S data_ov002_022d016c;
extern struct T data_ov002_022cd73c;
extern int data_ov002_022cd744[];
extern struct P data_ov002_022cf198[];
extern int func_ov002_021b0388(int player);
int func_ov002_021b04c8(void) {
    int a, b;
    if (data_ov002_022d016c.f_d0c != 0) {
        if (data_ov002_022cd744[data_ov002_022d016c.f_cec] == 2) return 0;
    }
    a = func_ov002_021b0388(data_ov002_022cd73c.b);
    b = func_ov002_021b0388(data_ov002_022cd73c.b ^ 1);
    if (a != 0 || b != 0 || data_ov002_022d016c.f_e0 != 0) {
        data_ov002_022cf198[data_ov002_022cd73c.b & 1].result = a;
        data_ov002_022cf198[(data_ov002_022cd73c.b ^ 1) & 1].result = b;
        if (a != 0 && b == 0) data_ov002_022d016c.f_d00 = 1;
        else if (a == 0 && b != 0) data_ov002_022d016c.f_d00 = 2;
        else data_ov002_022d016c.f_d00 = 3;
        data_ov002_022d016c.f_e0 = 1;
        return 1;
    }
    return 0;
}
