/* func_ov002_02212fbc: for each k in [0, self->count8), fetch a value via
 * func_ov002_0223df38(self,k,&local); on success split it into byte0=lo,
 * byte1=(signed hi-byte via a 16-bit-then-arithmetic-shift chain), and if
 * func_ov002_0225764c(self,byte0,byte1) is nonzero OR in a bit at position
 * byte1+byte0*16 into mask. Finally func_ov002_021de9c0(self, mask). */
typedef struct {
    char pad[6];
    unsigned short count8 : 8;
} Self12fbc;

extern int func_ov002_0223df38(void *self, int k, int *outPtr);
extern int func_ov002_0225764c(void *self, int byte0, int byte1);
extern int func_ov002_021de9c0(void *self, int mask);

int func_ov002_02212fbc(Self12fbc *self) {
    int k, mask;
    int local;

    k = mask = 0;
    for (; k < self->count8; k++) {
        if (func_ov002_0223df38(self, k, &local) != 0) {
            int hi = (int)(unsigned short)local >> 8;
            int byte0 = local & 0xff;
            int byte1 = hi & 0xff;
            if (func_ov002_0225764c(self, byte0, byte1) != 0) {
                int shiftAmt = byte1 + byte0 * 16;
                mask |= 1 << shiftAmt;
            }
        }
    }
    func_ov002_021de9c0(self, mask);
    return 0;
}
