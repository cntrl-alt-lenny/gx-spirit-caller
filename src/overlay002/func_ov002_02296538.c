/* func_ov002_02296538: brief 230 C-39d — if(helper1(!bit0,1,0)) return helper2(bit0,LIT)>0; else 0.
 *
 *     bl helper1(!bit0, 1, 0); cmp #0; beq .fail
 *     bl helper2(bit0, 0x198e); cmp #0; movgt #1; movle #0; pop
 *     .fail: mov r0, #0; pop
 *
 * Pool LIT = 0x198e = 6542.
 */

struct F02296538_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02296538_Self {
    unsigned short pad0;
    struct F02296538_F2 f2;
};
extern int func_ov002_021bc0d4(unsigned int v, unsigned int k1, unsigned int z);
extern int func_ov002_02281994(unsigned int bit, unsigned int lit);

int func_ov002_02296538(struct F02296538_Self *self) {
    if (func_ov002_021bc0d4(1 - self->f2.bit0, 1, 0)) {
        return func_ov002_02281994(self->f2.bit0, 6542) > 0;
    }
    return 0;
}
