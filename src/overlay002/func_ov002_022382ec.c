/* func_ov002_022382ec: brief 230 C-39d — D1 with pool literal arg.
 *
 *     bl helper(bit0, 3000); re-read; bl helper(!bit0, 3000); return 0
 *
 * Pool literal 0x00000bb8 = 3000.
 */

struct F022382ec_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022382ec_Self {
    unsigned short pad0;
    struct F022382ec_F2 f2;
};
extern int func_ov002_021df73c(unsigned int bit, unsigned int n);

int func_ov002_022382ec(struct F022382ec_Self *self) {
    func_ov002_021df73c(self->f2.bit0, 3000);
    func_ov002_021df73c(1 - self->f2.bit0, 3000);
    return 0;
}
