/* func_ov002_0220db6c: C-39b helper1(bit0, 11, f0) ne-check + tail-call.
 *
 * Same helper1 signature as 0220dc9c and 02206954, different polarity:
 * here `!= 0 → return 0`.
 */

struct F0220dc5c_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F0220dc5c_Self { unsigned short f0; struct F0220dc5c_F2 f2; };

extern int func_ov002_021b3dec(unsigned int bit, int eleven, unsigned short f0);
extern int func_ov002_021ff37c(struct F0220dc5c_Self *self, int arg1);

int func_ov002_0220db6c(struct F0220dc5c_Self *self, int arg1) {
    if (func_ov002_021b3dec(self->f2.bit0, 0xb, self->f0) != 0) return 0;
    return func_ov002_021ff37c(self, arg1);
}
