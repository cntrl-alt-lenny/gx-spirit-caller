/* func_ov002_021f495c: brief 236 — helper(bit0, fld5, 0xfb6, 2, 0); return 1.
 * 5-arg helper with stack-spilled 5th arg = 0.
 */

struct F021f4a4c_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f4a4c_Self {
    unsigned short pad0;
    struct F021f4a4c_F2 f2;
};

extern int func_ov002_021d58dc(unsigned int bit, unsigned int fld, unsigned int lit, unsigned int two, unsigned int z);

int func_ov002_021f495c(struct F021f4a4c_Self *self) {
    func_ov002_021d58dc(self->f2.bit0, self->f2.fld5, 0xfb6, 2, 0);
    return 1;
}
