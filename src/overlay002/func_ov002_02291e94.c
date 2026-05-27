/* func_ov002_02291e94: C-39b helper1(self) cond + helper2(1-bit0, 0, 1) gt-check.
 *
 *   if (helper1(self) != 0) {
 *       if (helper2(1 - bit0, 0, 1) > 0) return 1;
 *   }
 *   return 0;
 */

struct F02291e94_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02291e94_Self { unsigned short f0; struct F02291e94_F2 f2; };

extern int func_ov002_02291160(struct F02291e94_Self *self);
extern int func_ov002_021bc0d4(unsigned int notbit, int zero, int one);

int func_ov002_02291e94(struct F02291e94_Self *self) {
    if (func_ov002_02291160(self) != 0) {
        if (func_ov002_021bc0d4(1 - self->f2.bit0, 0, 1) > 0) return 1;
    }
    return 0;
}
