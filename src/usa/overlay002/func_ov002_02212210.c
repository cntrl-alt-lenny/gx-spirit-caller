/* func_ov002_02212210: guard func_ov002_0223de48(self,0,0)!=0. Resolve
 * byte1/byte2 from func_ov002_0223dda4(self,0)'s low/high byte; if the
 * per-player cf1a4 u16 at byte2*20 is nonzero, forward to
 * func_ov002_021d58dc(byte1,byte2,0x1119,4,0). Always returns 0. */
typedef unsigned short u16;

extern char data_ov002_022cf0c4[];
extern int func_ov002_0223de48(void *self, int flag, int *outPtr);
extern int func_ov002_0223dda4(void *self, int idx);
extern int func_ov002_021d58dc(unsigned int bit, unsigned int fld, unsigned int lit, unsigned int mode, unsigned int z);

int func_ov002_02212210(void *self) {
    if (func_ov002_0223de48(self, 0, 0) != 0) {
        int result = func_ov002_0223dda4(self, 0);
        int byte1 = result & 0xff;
        u16 u16val = (u16)result;
        int byte2 = (u16val >> 8) & 0xff;
        if (*(unsigned short *)(data_ov002_022cf0c4 + (byte1 & 1) * 0x868 + byte2 * 20) != 0) {
            func_ov002_021d58dc(byte1, byte2, 0x1119, 4, 0);
        }
    }
    return 0;
}
