/* func_ov002_0222f78c: tag6 + if-else 2 helpers. */
struct F0222f78cSelf {
    unsigned short f0;
    struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2;
};
extern int func_ov002_02227c4c(struct F0222f78cSelf *self, int arg);
extern int func_ov002_02211b64(struct F0222f78cSelf *self, int arg);
int func_ov002_0222f78c(struct F0222f78cSelf *self, int arg) {
    if (self->f2.tag6 == 0x19) {
        return func_ov002_02227c4c(self, arg);
    }
    return func_ov002_02211b64(self, arg);
}
