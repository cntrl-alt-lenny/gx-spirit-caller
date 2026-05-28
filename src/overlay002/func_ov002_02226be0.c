/* func_ov002_02226be0: tag6 bitfield + if-else 2 helpers (gotcha 7). */
struct F02226be0Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_022117e0(struct F02226be0Self *self, int arg);
extern int func_ov002_02210810(struct F02226be0Self *self, int arg);

int func_ov002_02226be0(struct F02226be0Self *self, int arg) {
    if (self->f2.tag6 == 0xf) {
        return func_ov002_022117e0(self, arg);
    }
    return func_ov002_02210810(self, arg);
}
