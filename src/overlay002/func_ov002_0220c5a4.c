/* func_ov002_0220c5a4: 021ff3bc-query predicate — bail if 021bcf00(bit0) or
 * 021bb90c(bit0, f0) fire, else return the 021ff3bc(self, arg1) query. */

struct Func0220c5a4F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func0220c5a4Self {
    unsigned short f0;
    struct Func0220c5a4F2 f2;
};

extern int func_ov002_021bcf00(unsigned int bit);
extern int func_ov002_021bb90c(unsigned int bit, unsigned int f0);
extern int func_ov002_021ff3bc(struct Func0220c5a4Self *self, int arg1);

int func_ov002_0220c5a4(struct Func0220c5a4Self *self, int arg1) {
    if (func_ov002_021bcf00(self->f2.bit0) != 0)
        return 0;
    if (func_ov002_021bb90c(self->f2.bit0, self->f0) != 0)
        return 0;
    return func_ov002_021ff3bc(self, arg1);
}
