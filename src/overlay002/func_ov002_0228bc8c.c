/* func_ov002_0228bc8c: C-39b helper1(self) cond + helper2(1-bit0, 1, 1) ne-check.
 *
 *   if (helper1(self) != 0) {
 *       if (helper2(1 - bit0, 1, 1) != 0) return 1;
 *   }
 *   return 0;
 */

struct F0228bc8c_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F0228bc8c_Self { unsigned short f0; struct F0228bc8c_F2 f2; };

extern int func_ov002_02286978(struct F0228bc8c_Self *self);
extern int func_ov002_021bc16c(unsigned int notbit, int one1, int one2);

int func_ov002_0228bc8c(struct F0228bc8c_Self *self) {
    if (func_ov002_02286978(self) != 0) {
        if (func_ov002_021bc16c(1 - self->f2.bit0, 1, 1) != 0) return 1;
    }
    return 0;
}
