/* func_ov002_0220db60: C-39b helper(bit0, multi5, f0) == 0 → return 0; tail.
 * Sibling of 0220d5f4 with different tail-call target.
 */

struct F0220db60_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F0220db60_Self { unsigned short f0; struct F0220db60_F2 f2; };

extern int func_ov002_021b3ecc(unsigned int bit, unsigned int multi, unsigned short f0);
extern int func_ov002_021fffa8(struct F0220db60_Self *self, int arg1);

int func_ov002_0220db60(struct F0220db60_Self *self, int arg1) {
    if (func_ov002_021b3ecc(self->f2.bit0, self->f2.multi5, self->f0) == 0) return 0;
    return func_ov002_021fffa8(self, arg1);
}
