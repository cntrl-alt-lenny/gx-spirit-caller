/* func_ov002_021f6378: brief 236 — interleaved 2-bitfield, helper(bit0, fld5); return 1.
 */

struct F021f6378_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f6378_Self {
    unsigned short pad0;
    struct F021f6378_F2 f2;
};

extern int func_ov002_021deb28(unsigned int bit, unsigned int fld);

int func_ov002_021f6378(struct F021f6378_Self *self) {
    func_ov002_021deb28(self->f2.bit0, self->f2.fld5);
    return 1;
}
