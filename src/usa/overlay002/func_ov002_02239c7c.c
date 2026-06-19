/* func_ov002_02239c7c: tag6 + if-else 2 helpers. */
struct F02239d6cSelf {
    unsigned short f0;
    struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2;
};
extern int func_ov002_02239ca4(struct F02239d6cSelf *self, int arg);
extern int func_ov002_02210014(struct F02239d6cSelf *self, int arg);
int func_ov002_02239c7c(struct F02239d6cSelf *self, int arg) {
    if (self->f2.tag6 == 6) {
        return func_ov002_02239ca4(self, arg);
    }
    return func_ov002_02210014(self, arg);
}
