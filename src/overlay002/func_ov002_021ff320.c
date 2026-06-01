/* func_ov002_021ff320: report 021b3ecc(bit0, field5, 0xFB6) clear. */
struct Func021ff320F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};
struct Func021ff320Self {
    unsigned short pad0;
    struct Func021ff320F2 f2;
};
extern int func_ov002_021b3ecc(unsigned int bit, unsigned int field5, int code);

int func_ov002_021ff320(struct Func021ff320Self *self) {
    if (func_ov002_021b3ecc(self->f2.bit0, self->f2.field5, 0xFB6) == 0)
        return 1;
    return 0;
}
