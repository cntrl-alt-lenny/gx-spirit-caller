/* func_ov002_02296b28: brief 230 C-39d — if(helper1(bit0,0x19fd)) return helper2(bit0,DATA)>0; else 0.
 *
 * Pool LIT1 = 0x19fd = 6653.
 * Pool LIT2 = 0x0202f430 = struct/data address (passed as integer arg).
 */

struct F02296b28_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02296b28_Self {
    unsigned short pad0;
    struct F02296b28_F2 f2;
};
extern int func_ov002_021c3ae4(unsigned int bit, unsigned int code);
extern int func_ov002_021bc000(unsigned int bit, unsigned int addr);

int func_ov002_02296b28(struct F02296b28_Self *self) {
    if (func_ov002_021c3ae4(self->f2.bit0, 6653)) {
        return func_ov002_021bc000(self->f2.bit0, 0x0202f430) > 0;
    }
    return 0;
}
