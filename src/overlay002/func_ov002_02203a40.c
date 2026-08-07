/* func_ov002_02203a40: gate chain on a0's bit0, then dispatch:
 * func_ov002_021ca698(bit0,bit0) must pass, func_ov002_021ff320(a0,a1)
 * must pass, then func_ov002_021b3ecc(bit0,0xb,0x14a0) selects between
 * func_ov002_021bbf50(bit0) > 1 and func_ov002_022536e8(bit0,val0,0) > 0.
 */
typedef unsigned short u16;

struct SA0 {
    u16 val0;
    u16 bit0 : 1;
};

extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_021ff320(struct SA0 *self, int arg);
extern int func_ov002_021b3ecc(int bit0, int f0, int zero);
extern int func_ov002_021bbf50(int bit0);
extern int func_ov002_022536e8(int bit0, u16 f0, int zero);

int func_ov002_02203a40(struct SA0 *a0, int a1) {
    if (func_ov002_021ca698(a0->bit0, a0->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021ff320(a0, a1) == 0) {
        return 0;
    }

    if (func_ov002_021b3ecc(a0->bit0, 0xb, 0x14a0) != 0) {
        return func_ov002_021bbf50(a0->bit0) > 1 ? 1 : 0;
    }

    return func_ov002_022536e8(a0->bit0, a0->val0, 0) > 0 ? 1 : 0;
}
