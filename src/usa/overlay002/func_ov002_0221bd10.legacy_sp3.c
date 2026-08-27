/* func_ov002_0221bd10: post via func_ov002_021e267c(bit0,val0,1,0); bail
 * if a0's bit2 (at offset+4) is set. Bail if func_ov002_0223de48(a0,0,0)
 * is 0. Otherwise call func_ov002_0223dda4(a0,0), split its low/high
 * bytes (low from the raw value, high from the u16-truncated value >>8)
 * and post via func_ov002_021d5918(a0, lo, hi, val0, 1, bit0).
 */
typedef unsigned short u16;

struct Ov002Self {
    u16 val0;
    u16 bit0 : 1;
    u16 _pad2 : 15;
    u16 _pad4_01 : 2;
    u16 bit2 : 1;
};

extern void func_ov002_021e267c(int bit0, u16 val0, int one, int zero);
extern int func_ov002_0223de48(void *self, int a, int b);
extern int func_ov002_0223dda4(void *node, int idx);
extern void func_ov002_021d5918(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);

int func_ov002_0221bd10(struct Ov002Self *a0) {
    int nodeResult;

    func_ov002_021e267c(a0->bit0, a0->val0, 1, 0);

    if (a0->bit2) {
        return 0;
    }

    if (func_ov002_0223de48(a0, 0, 0) == 0) {
        goto return_zero;
    }

    nodeResult = func_ov002_0223dda4(a0, 0);
    func_ov002_021d5918(a0, nodeResult & 0xff, ((u16)nodeResult >> 8) & 0xff,
        a0->val0, 1, a0->bit0);

return_zero:
    return 0;
}
