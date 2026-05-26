/* func_ov002_02206668: C-39b tag-check early-return + cross-call compare.
 *
 *   if (self->f2.tag6 == 0x23) return 1;
 *   int n = helper(self->f2.bit0);
 *   return n >= helper2(self);
 *
 * Orig (72 B, 18 ARM insns): tag6 early-return via `cmp; moveq #1;
 * ldmeqia` predicated pop; then bit0 helper, helper2 cross-call compare.
 */

struct F02206668_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F02206668_Self { unsigned short f0; struct F02206668_F2 f2; };

extern int func_ov002_021c24f8(unsigned int bit);
extern int func_ov002_021f4194(struct F02206668_Self *self);

int func_ov002_02206668(struct F02206668_Self *self) {
    int n;
    if (self->f2.tag6 == 0x23) return 1;
    n = func_ov002_021c24f8(self->f2.bit0);
    return n >= func_ov002_021f4194(self);
}
