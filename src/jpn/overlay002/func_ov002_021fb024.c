/* func_ov002_021fb024: tag6 bitfield + helper-tail (brief 242 recipe). */
struct FuncOv002021fb114Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_021f8670(struct FuncOv002021fb114Self *self, int arg);

int func_ov002_021fb024(struct FuncOv002021fb114Self *self, int arg) {
    if (self->f2.tag6 != 0xf) return 1;
    return func_ov002_021f8670(self, arg);
}
