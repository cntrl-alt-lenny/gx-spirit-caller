/* func_ov002_02242d24: tag6 bitfield + helper-tail. */
struct FuncOv00202242e0cSelf {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_02241318(struct FuncOv00202242e0cSelf *self, int arg);

int func_ov002_02242d24(struct FuncOv00202242e0cSelf *self, int arg) {
    if (self->f2.tag6 == 0xd) return 1;
    return func_ov002_02241318(self, arg);
}
