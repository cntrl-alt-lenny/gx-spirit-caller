/* func_ov002_02243290: family 8 sibling (different helper). */
struct F02243290 {
    char pad[0x14];
    struct {
        unsigned int low9 : 9;
        unsigned int bit9 : 1;
        unsigned int tag4 : 4;
        unsigned int rest : 18;
    } f14;
};

extern void func_ov002_0223db04(struct F02243290 *self, unsigned int bit9, unsigned int tag4);

int func_ov002_02243290(struct F02243290 *self) {
    func_ov002_0223db04(self, self->f14.bit9, self->f14.tag4);
    return 1;
}
