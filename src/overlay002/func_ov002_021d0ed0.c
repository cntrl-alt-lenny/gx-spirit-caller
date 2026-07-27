/* func_ov002_021d0ed0: void state-machine step keyed on data_ov002_022ce950's
 * f_810 (0, 1, or other). */
struct S021d0ed0 { short f0; short f2; char pad[0x80c - 4]; int f80c; int f810; };
extern struct S021d0ed0 data_ov002_022ce950;
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d0ed0(void) {
    int flag;
    int f810;
    int f2;
    flag = ((unsigned short)data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    f810 = data_ov002_022ce950.f810;
    f2 = (unsigned short)data_ov002_022ce950.f2;
    switch (f810) {
    case 0:
        func_ov002_0229ade0(0x15, flag, f2, 0);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x15) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
        break;
    }
}
