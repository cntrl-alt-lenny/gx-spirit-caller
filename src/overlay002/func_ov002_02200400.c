/* func_ov002_02200400: field6==0x23 skips the 021bb91c(0x128b) gate, then tail
 * 021ff46c(self, arg1). */

struct F02200400_F2 {
    unsigned short        : 6;
    unsigned short field6 : 6;
    unsigned short        : 4;
};
struct F02200400_Self {
    unsigned short f0;
    struct F02200400_F2 f2;
};

extern int func_ov002_021bb91c(int code);
extern int func_ov002_021ff46c(struct F02200400_Self *self, int arg1);

int func_ov002_02200400(struct F02200400_Self *self, int arg1) {
    if (self->f2.field6 != 0x23) {
        if (func_ov002_021bb91c(0x128b) == 0) return 0;
    }
    return func_ov002_021ff46c(self, arg1);
}
