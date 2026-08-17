/* func_ov010_021b46a8: get a threshold n from func_ov005_021ac9c8; if
 * positive, compute a velocity v via func_020b3870. Bail early unless
 * a global mode field is 2, and unless the remaining span (a1->f6-a1->f2)
 * is >= n. If v already equals the cached field_e0, just set a status
 * bit; otherwise re-target via func_ov010_021b3a14 and dispatch
 * func_02037208 with the standard (id,-1,0,1) convention.
 */

typedef struct {
    char _pad2[2];
    short f2;
    char _pad4[2];
    short f6;
} Arg1T;

extern struct {
    char _pad_12c[0x12c];
    int field_12c;
} data_ov010_021b91b4;

typedef struct {
    int field_0;
    int field_4;
    char _pad_84[0x84 - 8];
    char at_84[1];
    char _pad_e0[0xe0 - 0x84 - 1];
    int field_e0;
    char _pad_220[0x220 - 0xe0 - 4];
    int field_220;
} Data9260;
extern Data9260 data_ov010_021b9260;

extern int func_ov005_021ac9c8(int h);
extern int func_020b3870(int a, int b);
extern void func_ov010_021b3a14(void *p, int v);
extern int func_02037208(int a, int b, int c, int d);

void func_ov010_021b46a8(int a0, Arg1T *a1) {
    Data9260 *d = &data_ov010_021b9260;
    int n = func_ov005_021ac9c8(data_ov010_021b91b4.field_12c);
    int v = 0;

    if (n > 0) {
        v = func_020b3870(a1->f2 - 0x24, n);
    }

    if (d->field_4 != 2) return;
    if ((a1->f6 - a1->f2) < n) return;

    if (v == d->field_e0) {
        d->field_220 |= 0x10;
        return;
    }

    func_ov010_021b3a14(d->at_84, v);
    d->field_0 = a0;
    func_02037208(0x38, 0x38 - 0x39, 0, 1);
}
