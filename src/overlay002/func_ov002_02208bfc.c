/* func_ov002_02208bfc: gate on func_ov002_021c23ac(bit0,field1_5) then
 * func_ov002_021ca2b8(bit0). If data_ov002_022cf17c[bit0*0x868] (byte
 * offset) is already nonzero, return 1. Otherwise call
 * func_ov002_0223f6c4(self), post via func_ov002_022536e8(bit0, val0,
 * that result), returning its truth value.
 */
typedef unsigned short u16;

struct SA0 {
    u16 val0;
    u16 bit0 : 1;
    u16 field1_5 : 5;
};

extern char data_ov002_022cf17c[];
extern int func_ov002_021c23ac(int bit0, int field1_5);
extern int func_ov002_021ca2b8(int bit0);
extern int func_ov002_0223f6c4(struct SA0 *self);
extern int func_ov002_022536e8(int bit0, u16 val0, int c);

int func_ov002_02208bfc(struct SA0 *a0) {
    int r;

    if (func_ov002_021c23ac(a0->bit0, a0->field1_5) == 0) {
        return 0;
    }
    if (func_ov002_021ca2b8(a0->bit0) == 0) {
        return 0;
    }

    if (*(int *)(data_ov002_022cf17c + (a0->bit0 & 1) * 0x868) != 0) {
        goto return_one;
    }

    r = func_ov002_0223f6c4(a0);
    if (func_ov002_022536e8(a0->bit0, a0->val0, r) == 0) {
        return 0;
    }

return_one:
    return 1;
}
