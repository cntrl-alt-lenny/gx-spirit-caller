/* func_ov002_0228b850: C-39b null-check + helper(1-bit0) + tail-call.
 *
 * Same shape as 0228b810 but helper1 takes `1-bit0` (rsb) instead of `bit0`.
 */

struct F0228b850_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F0228b850_Self { unsigned short f0; struct F0228b850_F2 f2; };

extern int func_ov002_02257ab8(struct F0228b850_Self *self, unsigned int bit);
extern int func_ov002_0228b5f4(struct F0228b850_Self *self, int arg1);

int func_ov002_0228b850(struct F0228b850_Self *self, int arg1) {
    if (arg1 == 0) return 0;
    if (func_ov002_02257ab8(self, 1 - self->f2.bit0) == 0) return 0;
    return func_ov002_0228b5f4(self, arg1);
}
