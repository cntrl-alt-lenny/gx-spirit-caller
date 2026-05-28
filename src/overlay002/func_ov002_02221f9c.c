/* func_ov002_02221f9c: tag6 bitfield + helper-tail (return 0 variant). */
struct FuncOv00202221f9cSelf {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_0221b5ac(struct FuncOv00202221f9cSelf *self, int arg);

int func_ov002_02221f9c(struct FuncOv00202221f9cSelf *self, int arg) {
    if (self->f2.tag6 != 0xd) return 0;
    return func_ov002_0221b5ac(self, arg);
}
