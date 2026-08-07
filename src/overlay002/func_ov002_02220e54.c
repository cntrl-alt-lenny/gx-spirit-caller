/* func_ov002_02220e54: gate on func_ov002_021ca63c(bit0,1). Bail if
 * a0->count (byte at offset+7) is 0. Otherwise call
 * func_ov002_0223def4(a0, count-1), then func_ov002_021b947c(void); if
 * that result's high byte (u16-truncated >>8) is 15, call
 * func_ov002_021d81d4(lowByte, defResult). Finally decrement
 * a0->count and store it back.
 */
typedef unsigned short u16;

struct SA0 {
    char _pad0[2];
    u16 bit0 : 1;
    u16 _pad2_rest : 15;
    char _pad4[2];
    u16 _pad6_lo : 8;
    u16 count : 8;
};

extern int func_ov002_021ca63c(int bit0, int k);
extern int func_ov002_0223def4(void *self, int idx);
extern int func_ov002_021b947c(void);
extern int func_ov002_021d81d4(int lowByte, int defResult);

int func_ov002_02220e54(struct SA0 *a0) {
    int defResult;
    int callResult;
    int highByte;

    if (func_ov002_021ca63c(a0->bit0, 1) == 0) {
        return 0;
    }
    if (a0->count == 0) {
        goto return_zero;
    }

    defResult = func_ov002_0223def4(a0, a0->count - 1);
    callResult = func_ov002_021b947c();
    highByte = ((u16)callResult >> 8) & 0xff;
    if (highByte == 15) {
        func_ov002_021d81d4(callResult & 0xff, defResult);
    }

    a0->count--;
    return 0x80;

return_zero:
    return 0;
}
