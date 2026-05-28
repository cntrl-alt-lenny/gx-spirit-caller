/* func_ov002_02208bb0: sub-shape 1 sibling, identical shape to 021f9954. */
struct FuncOv00202208bb0Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_02208bfc(struct FuncOv00202208bb0Self *self, int arg);

int func_ov002_02208bb0(struct FuncOv00202208bb0Self *self, int arg) {
    if (self->f2.tag6 != 2) return 1;
    return func_ov002_02208bfc(self, arg);
}
