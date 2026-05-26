/* func_ov002_022093c4: C-39b sibling of 02208b68 with different tag (0x1814). */

struct F022093c4_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short rest   : 10;
};
struct F022093c4_Self { unsigned short f0; struct F022093c4_F2 f2; };

extern int func_ov002_021b4098(unsigned int bit, unsigned int multi, int tag);
extern int func_ov002_02208bfc(struct F022093c4_Self *self, int arg1);

int func_ov002_022093c4(struct F022093c4_Self *self, int arg1) {
    if (func_ov002_021b4098(self->f2.bit0, self->f2.multi5, 0x1814) == 0) return 0;
    return func_ov002_02208bfc(self, arg1);
}
