/* func_ov002_02244a50: family 8 sibling (same helper as 02243290). */
struct F02244a50 {
    char pad[0x14];
    struct {
        unsigned int low9 : 9;
        unsigned int bit9 : 1;
        unsigned int tag4 : 4;
        unsigned int rest : 18;
    } f14;
};

extern void func_ov002_0223db04(struct F02244a50 *self, unsigned int bit9, unsigned int tag4);

int func_ov002_02244a50(struct F02244a50 *self) {
    func_ov002_0223db04(self, self->f14.bit9, self->f14.tag4);
    return 1;
}
