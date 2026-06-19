/* func_ov002_02291e98: C-39b helper(bit0) early-return + helper2(self,bit0) bool tail.
 *
 *   if (helper1(self->f2.bit0, TAG) == 0) return 0;
 *   return helper2(self, self->f2.bit0) > 1;
 */

struct F02291fa8_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02291fa8_Self { unsigned short f0; struct F02291fa8_F2 f2; };

extern int func_ov002_021bbf20(unsigned int bit, int (*fnref)(int));
extern int func_ov002_021ff1d8(struct F02291fa8_Self *self, unsigned int bit);
extern int func_0202e2d4(int);

int func_ov002_02291e98(struct F02291fa8_Self *self) {
    if (func_ov002_021bbf20(self->f2.bit0, func_0202e2d4) != 0) {
        return func_ov002_021ff1d8(self, self->f2.bit0) > 1;
    }
    return 0;
}
