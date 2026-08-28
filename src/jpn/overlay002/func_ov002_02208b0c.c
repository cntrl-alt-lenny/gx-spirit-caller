/* func_ov002_02208b0c: gate on func_ov002_021c22cc(bit0,field1_5) then
 * func_ov002_021ca1d8(bit0). If data_ov002_022cf09c[bit0*0x868] (byte
 * offset) is already nonzero, return 1. Otherwise call
 * func_ov002_0223f5dc(self), post via func_ov002_02253600(bit0, val0,
 * that result), returning its truth value.
 */
typedef unsigned short u16;

struct SA0 {
    u16 val0;
    u16 bit0 : 1;
    u16 field1_5 : 5;
};

extern char data_ov002_022cf09c[];
extern int func_ov002_021c22cc(int bit0, int field1_5);
extern int func_ov002_021ca1d8(int bit0);
extern int func_ov002_0223f5dc(struct SA0 *self);
extern int func_ov002_02253600(int bit0, u16 val0, int c);

int func_ov002_02208b0c(struct SA0 *a0) {
    int r;

    if (func_ov002_021c22cc(a0->bit0, a0->field1_5) == 0) {
        return 0;
    }
    if (func_ov002_021ca1d8(a0->bit0) == 0) {
        return 0;
    }

    if (*(int *)(data_ov002_022cf09c + (a0->bit0 & 1) * 0x868) != 0) {
        goto return_one;
    }

    r = func_ov002_0223f5dc(a0);
    if (func_ov002_02253600(a0->bit0, a0->val0, r) == 0) {
        return 0;
    }

return_one:
    return 1;
}
