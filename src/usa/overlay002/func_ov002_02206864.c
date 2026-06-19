/* func_ov002_02206864: C-39b helper1(bit0, 11, f0) eq-check + tail-call. */

struct F02206954_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02206954_Self { unsigned short f0; struct F02206954_F2 f2; };

extern int func_ov002_021b3dec(unsigned int bit, int eleven, unsigned short f0);
extern int func_ov002_021ff2cc(struct F02206954_Self *self, int arg1);

int func_ov002_02206864(struct F02206954_Self *self, int arg1) {
    if (func_ov002_021b3dec(self->f2.bit0, 0xb, self->f0) == 0) return 0;
    return func_ov002_021ff2cc(self, arg1);
}
