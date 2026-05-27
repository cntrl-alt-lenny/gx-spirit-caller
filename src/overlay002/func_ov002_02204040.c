/* func_ov002_02204040: C-39b helper1(bit0) + helper2(self,arg1) returning
 * 2 if non-zero else 0.
 *
 *   helper1(bit0); if == 0 → return 0
 *   helper2(self, arg1); return (ret != 0) ? 2 : 0
 */

struct F02204040_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02204040_Self { unsigned short f0; struct F02204040_F2 f2; };

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021ff500(struct F02204040_Self *self, int arg1);

int func_ov002_02204040(struct F02204040_Self *self, int arg1) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    return func_ov002_021ff500(self, arg1) != 0 ? 2 : 0;
}
