/* func_ov002_02244bcc: tag6 bitfield + helper-tail. */
struct FuncOv00202244cb4Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_0223f938(struct FuncOv00202244cb4Self *self, int arg);

int func_ov002_02244bcc(struct FuncOv00202244cb4Self *self, int arg) {
    if (self->f2.tag6 != 6) return 1;
    return func_ov002_0223f938(self, arg);
}
