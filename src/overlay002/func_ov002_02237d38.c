/* func_ov002_02237d38: tag6 + if-else 2 helpers. */
struct F02237d38Self {
    unsigned short f0;
    struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2;
};
extern int func_ov002_02237d60(struct F02237d38Self *self, int arg);
extern int func_ov002_0221074c(struct F02237d38Self *self, int arg);
int func_ov002_02237d38(struct F02237d38Self *self, int arg) {
    if (self->f2.tag6 == 5) {
        return func_ov002_02237d60(self, arg);
    }
    return func_ov002_0221074c(self, arg);
}
