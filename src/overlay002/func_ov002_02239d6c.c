/* func_ov002_02239d6c: tag6 + if-else 2 helpers. */
struct F02239d6cSelf {
    unsigned short f0;
    struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2;
};
extern int func_ov002_02239d94(struct F02239d6cSelf *self, int arg);
extern int func_ov002_02210104(struct F02239d6cSelf *self, int arg);
int func_ov002_02239d6c(struct F02239d6cSelf *self, int arg) {
    if (self->f2.tag6 == 6) {
        return func_ov002_02239d94(self, arg);
    }
    return func_ov002_02210104(self, arg);
}
