/* func_ov002_021d1abc: if data_ov002_022ce950.f810 is 0, seed d016c.f_cf4
 * from f_cf0 (only when f2==0), fire a 0x3d command carrying f2, and
 * increment f810. Otherwise, clear f80c only if func_ov002_0229c7f8(0x3d)
 * reports 0. */
typedef struct {
    char _pad0[2];
    unsigned short f2;
    char _pad1[0x808];
    int f80c;
    int f810;
} S021d1abc;

typedef struct {
    char _pad0[0xcf0];
    int f_cf0;
    int f_cf4;
} D016cLocal;

extern S021d1abc data_ov002_022ce950;
extern D016cLocal data_ov002_022d016c;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d1abc(void) {
    unsigned short f2 = data_ov002_022ce950.f2;

    if (data_ov002_022ce950.f810 == 0) {
        if (f2 == 0) {
            data_ov002_022d016c.f_cf4 = data_ov002_022d016c.f_cf0;
        }
        func_ov002_0229ade0(0x3d, f2, 0, 0);
        data_ov002_022ce950.f810++;
    } else {
        if (func_ov002_0229c7f8(0x3d) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
    }
}
