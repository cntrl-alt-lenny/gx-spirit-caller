/* func_ov002_0220cdb0: tag6 bitfield + helper-tail (brief 242 recipe). */
struct FuncOv0020220cdb0Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_02209130(struct FuncOv0020220cdb0Self *self, int arg);

int func_ov002_0220cdb0(struct FuncOv0020220cdb0Self *self, int arg) {
    if (self->f2.tag6 != 5) return 1;
    return func_ov002_02209130(self, arg);
}
