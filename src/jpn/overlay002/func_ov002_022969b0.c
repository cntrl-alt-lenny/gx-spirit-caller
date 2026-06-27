
typedef unsigned short u16;

struct S02296ac0 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02259e8c(unsigned int bit);
extern int func_ov002_02280870(unsigned int bit);
extern int func_ov002_021bc14c(unsigned int bit, unsigned int k);

int func_ov002_022969b0(struct S02296ac0 *self) {
    if (func_ov002_02259e8c(self->b0) == 0) return 0;
    if (func_ov002_02280870(self->b0) <= 0) return 0;
    return func_ov002_021bc14c(1 - self->b0, 1) != 0;
}
