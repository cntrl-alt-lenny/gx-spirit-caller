/* func_ov002_022445f0: gate on func_ov002_02257a60(self, arg1) [implicit
 * pass-through 2nd param, same pattern as func_ov002_022271b0's case 0x80],
 * then run a 2-iteration loop and one fixed (i=0) tail block, each computing
 * a composite index from two func_ov002_021afab0(i) pointer reads (same
 * "(b<<2)>>24<<1 + (a<<18)>>31" formula shape as func_ov002_0224446c's
 * case 2) and forwarding it to func_ov002_0223dd14.
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct S {
    u16 f_0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_02257a60(struct S *self, int arg1);
extern void *func_ov002_021afab0(int i);
extern void func_ov002_0223dd14(struct S *self, int arg1, int arg2, int arg3);
extern int func_ov002_022535a4(int ctx, int card_id, int arg2);

int func_ov002_022445f0(struct S *self, int arg1) {
    int i;

    if (func_ov002_02257a60(self, arg1) == 0) return -1;

    func_ov002_022535a4(self->bit0, self->f_0, 0x194f);

    for (i = 0; i < 2; i++) {
        int *ptr_a = func_ov002_021afab0(i);
        int *ptr_b = func_ov002_021afab0(i);
        u32 b_val = (u32)*ptr_b;
        u32 a_val = (u32)*ptr_a;
        u32 idx = (a_val << 18 >> 31) + (((b_val << 2) >> 24) << 1);
        func_ov002_0223dd14(self, self->bit0, 0xe, idx);
    }

    func_ov002_022535a4(self->bit0, self->f_0, 0x1950);
    {
        int *ptr_c = func_ov002_021afab0(0);
        int *ptr_d = func_ov002_021afab0(0);
        u32 a_val = (u32)*ptr_c;
        u32 b_val = (u32)*ptr_d;
        u32 idx = (a_val << 18 >> 31) + (((b_val << 2) >> 24) << 1);
        func_ov002_0223dd14(self, self->bit0, 0xe, idx);
    }
    return 1;
}
