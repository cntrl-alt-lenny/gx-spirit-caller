/* func_ov002_022960e8: C-39b helper1 cond + helper2(1-bit0, 1, 0, 1) bool.
 *
 *   if (helper1(self) != 0) {
 *       return helper2(1 - bit0, 1, 0, 1) > 0;
 *   }
 *   return 0;
 */

struct F022960e8_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022960e8_Self { unsigned short f0; struct F022960e8_F2 f2; };

extern int func_ov002_02291114(struct F022960e8_Self *self);
extern int func_ov002_021bcf18(unsigned int notbit, int one, int zero, int one2);

int func_ov002_022960e8(struct F022960e8_Self *self) {
    if (func_ov002_02291114(self) != 0) {
        return func_ov002_021bcf18(1 - self->f2.bit0, 1, 0, 1) > 0;
    }
    return 0;
}
