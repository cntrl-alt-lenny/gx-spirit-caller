/* func_ov002_0220d504: C-39b helper(bit0, multi5, f0) == 0 → return 0; tail. */

struct F0220d5f4_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F0220d5f4_Self { unsigned short f0; struct F0220d5f4_F2 f2; };

extern int func_ov002_021b3dec(unsigned int bit, unsigned int multi, unsigned short f0);
extern int func_ov002_0220727c(struct F0220d5f4_Self *self, int arg1);

int func_ov002_0220d504(struct F0220d5f4_Self *self, int arg1) {
    if (func_ov002_021b3dec(self->f2.bit0, self->f2.multi5, self->f0) == 0) return 0;
    return func_ov002_0220727c(self, arg1);
}
