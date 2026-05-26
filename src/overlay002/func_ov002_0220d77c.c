/* func_ov002_0220d77c: C-39b helper(bit0, multi5, f0) != 0 → return 0; tail.
 * Sibling of 0220d5f4 with inverted polarity.
 */

struct F0220d77c_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F0220d77c_Self { unsigned short f0; struct F0220d77c_F2 f2; };

extern int func_ov002_021b3ecc(unsigned int bit, unsigned int multi, unsigned short f0);
extern int func_ov002_021ff320(struct F0220d77c_Self *self, int arg1);

int func_ov002_0220d77c(struct F0220d77c_Self *self, int arg1) {
    if (func_ov002_021b3ecc(self->f2.bit0, self->f2.multi5, self->f0) != 0) return 0;
    return func_ov002_021ff320(self, arg1);
}
