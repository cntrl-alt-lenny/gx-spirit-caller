/* func_ov002_02296a0c: brief 234 — helper(bit0, 0x19fd) == 0.
 */

struct F02296a0c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02296a0c_Self {
    unsigned short pad0;
    struct F02296a0c_F2 f2;
};

extern int func_ov002_021bbd14(unsigned int bit, unsigned int code);

int func_ov002_02296a0c(struct F02296a0c_Self *self) {
    return func_ov002_021bbd14(self->f2.bit0, 0x19fd) == 0;
}
