/* func_ov002_02205c0c: tag6 bitfield + helper-tail (brief 242 recipe). */
struct FuncOv00202205cfcSelf {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_021ffff4(struct FuncOv00202205cfcSelf *self, int arg);

int func_ov002_02205c0c(struct FuncOv00202205cfcSelf *self, int arg) {
    if (self->f2.tag6 == 0xf) return 1;
    return func_ov002_021ffff4(self, arg);
}
