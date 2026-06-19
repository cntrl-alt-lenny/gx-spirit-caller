/* func_ov002_0222ece8: tag6 + if-else 2 helpers. */
struct F0222edd8Self {
    unsigned short f0;
    struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2;
};
extern int func_ov002_02211a74(struct F0222edd8Self *self, int arg);
extern int func_ov002_02223c58(struct F0222edd8Self *self, int arg);
int func_ov002_0222ece8(struct F0222edd8Self *self, int arg) {
    if (self->f2.tag6 == 5) {
        return func_ov002_02211a74(self, arg);
    }
    return func_ov002_02223c58(self, arg);
}
