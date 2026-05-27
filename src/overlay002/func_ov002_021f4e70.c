/* func_ov002_021f4e70: brief 236 — sibling of 021f4a4c, helper(bit0, fld5, 0x1119, 3, 0); return 1. */

struct F021f4e70_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f4e70_Self {
    unsigned short pad0;
    struct F021f4e70_F2 f2;
};

extern int func_ov002_021d59cc(unsigned int bit, unsigned int fld, unsigned int lit, unsigned int three, unsigned int z);

int func_ov002_021f4e70(struct F021f4e70_Self *self) {
    func_ov002_021d59cc(self->f2.bit0, self->f2.fld5, 0x1119, 3, 0);
    return 1;
}
