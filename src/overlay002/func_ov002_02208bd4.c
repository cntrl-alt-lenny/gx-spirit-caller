/* func_ov002_02208bd4: tag6 bitfield + if-else 2 helpers (gotcha 7). */
struct F02208bd4Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_02208b68(struct F02208bd4Self *self, int arg);
extern int func_ov002_02204b68(struct F02208bd4Self *self, int arg);

int func_ov002_02208bd4(struct F02208bd4Self *self, int arg) {
    if (self->f2.tag6 == 5) {
        return func_ov002_02208b68(self, arg);
    }
    return func_ov002_02204b68(self, arg);
}
