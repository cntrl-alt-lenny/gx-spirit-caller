/* func_ov002_02206954: C-39b helper1(bit0, 11, f0) eq-check + tail-call. */

struct F02206954_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02206954_Self { unsigned short f0; struct F02206954_F2 f2; };

extern int func_ov002_021b3ecc(unsigned int bit, int eleven, unsigned short f0);
extern int func_ov002_021ff3bc(struct F02206954_Self *self, int arg1);

int func_ov002_02206954(struct F02206954_Self *self, int arg1) {
    if (func_ov002_021b3ecc(self->f2.bit0, 0xb, self->f0) == 0) return 0;
    return func_ov002_021ff3bc(self, arg1);
}
