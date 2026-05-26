/* func_ov002_02208b68: C-39b 4-arg helper with literal + tail-call.
 *
 *   helper1(bit0, multi5, 0x17d2); if == 0 → return 0
 *   return helper2(self, arg1);
 */

struct F02208b68_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F02208b68_Self { unsigned short f0; struct F02208b68_F2 f2; };

extern int func_ov002_021b4098(unsigned int bit, unsigned int multi, int tag);
extern int func_ov002_02208bfc(struct F02208b68_Self *self, int arg1);

int func_ov002_02208b68(struct F02208b68_Self *self, int arg1) {
    if (func_ov002_021b4098(self->f2.bit0, self->f2.multi5, 0x17d2) == 0) return 0;
    return func_ov002_02208bfc(self, arg1);
}
