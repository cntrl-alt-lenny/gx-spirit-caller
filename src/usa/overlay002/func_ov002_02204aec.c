/* func_ov002_02204aec: C-39b 2-bitfield helper + early-return + tail-call.
 *
 * Sibling shape of 02296bc0 with different helpers and cmp threshold.
 */

struct F02204bdc_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F02204bdc_Self { unsigned short f0; struct F02204bdc_F2 f2; };

extern int func_ov002_021b9af4(unsigned int bit, unsigned int multi);
extern int func_ov002_02205d18(struct F02204bdc_Self *self, int arg1);

int func_ov002_02204aec(struct F02204bdc_Self *self, int arg1) {
    if (func_ov002_021b9af4(self->f2.bit0, self->f2.multi5) < 2) return 0;
    return func_ov002_02205d18(self, arg1);
}
