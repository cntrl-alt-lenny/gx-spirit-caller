/* func_ov002_02223cec: brief 236 — sibling of 021f97e8 (return 0 instead of 1).
 */

struct F02223ddc_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02223ddc_Self {
    unsigned short pad0;
    struct F02223ddc_F2 f2;
};

extern int func_ov002_021d6ba8(struct F02223ddc_Self *self, unsigned int bit, unsigned int fld);

int func_ov002_02223cec(struct F02223ddc_Self *self) {
    func_ov002_021d6ba8(self, self->f2.bit0, self->f2.fld5);
    return 0;
}
