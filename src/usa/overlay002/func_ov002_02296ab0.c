/* func_ov002_02296ab0: C-39b 2-bitfield helper + early-return + tail-call.
 *
 * helper(bit0, multi5); if < 5 return 0; tail-call helper2(self, arg1).
 */

struct F02296bc0_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F02296bc0_Self { unsigned short f0; struct F02296bc0_F2 f2; };

extern int func_ov002_021b9d68(unsigned int bit, unsigned int multi);
extern int func_ov002_02291104(struct F02296bc0_Self *self, int arg1);

int func_ov002_02296ab0(struct F02296bc0_Self *self, int arg1) {
    if (func_ov002_021b9d68(self->f2.bit0, self->f2.multi5) < 5) return 0;
    return func_ov002_02291104(self, arg1);
}
