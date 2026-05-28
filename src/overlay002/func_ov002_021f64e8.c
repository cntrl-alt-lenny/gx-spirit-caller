/* func_ov002_021f64e8: tag6 bitfield + helper-tail (brief 242 recipe).
 *
 *     ldrh tag6; cmp r2, #0x16; movne r0, #1; popne
 *     bl func_ov002_021f4df4; pop
 */
struct FuncOv002021f64e8Self {
    unsigned short f0;
    struct {
        unsigned short pad  : 6;
        unsigned short tag6 : 6;
        unsigned short top  : 4;
    } f2;
};

extern int func_ov002_021f4df4(struct FuncOv002021f64e8Self *self, int arg);

int func_ov002_021f64e8(struct FuncOv002021f64e8Self *self, int arg) {
    if (self->f2.tag6 != 0x16) return 1;
    return func_ov002_021f4df4(self, arg);
}
