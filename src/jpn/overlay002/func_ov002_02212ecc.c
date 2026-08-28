/* func_ov002_02212ecc: for each k in [0, self->count8), fetch a value via
 * func_ov002_0223de48(self,k,&local); on success split it into byte0=lo,
 * byte1=(signed hi-byte via a 16-bit-then-arithmetic-shift chain), and if
 * func_ov002_02257564(self,byte0,byte1) is nonzero OR in a bit at position
 * byte1+byte0*16 into mask. Finally func_ov002_021de8d0(self, mask). */
typedef struct {
    char pad[6];
    unsigned short count8 : 8;
} Self12fbc;

extern int func_ov002_0223de48(void *self, int k, int *outPtr);
extern int func_ov002_02257564(void *self, int byte0, int byte1);
extern int func_ov002_021de8d0(void *self, int mask);

int func_ov002_02212ecc(Self12fbc *self) {
    int k, mask;
    int local;

    k = mask = 0;
    for (; k < self->count8; k++) {
        if (func_ov002_0223de48(self, k, &local) != 0) {
            int hi = (int)(unsigned short)local >> 8;
            int byte0 = local & 0xff;
            int byte1 = hi & 0xff;
            if (func_ov002_02257564(self, byte0, byte1) != 0) {
                int shiftAmt = byte1 + byte0 * 16;
                mask |= 1 << shiftAmt;
            }
        }
    }
    func_ov002_021de8d0(self, mask);
    return 0;
}
