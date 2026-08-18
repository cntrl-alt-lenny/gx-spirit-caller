/* func_0204b0d0: with arg!=0, return a masked status word from the
 * global context singleton; with arg==0, OR together a bitmask built
 * from a per-slot shift table over the singleton's active count. */

struct S0204b0d0_Obj {
    unsigned char _pad_00[0xd];
    unsigned char count;   /* +0xd */
    unsigned char _pad_e[0x2d0 - 0xe];
    unsigned char arr_2d0[1];   /* +0x2d0 */
    unsigned char _pad_2d1[0x2f0 - 0x2d1];
    int f_2f0;                     /* +0x2f0 */
};

extern struct S0204b0d0_Obj *func_020498f0(void);

int func_0204b0d0(int a0) {
    int i;
    int result;
    int count;

    result = 0;
    if (a0 != 0) {
        return func_020498f0()->f_2f0 & ~1;
    }

    i = 1;
    count = func_020498f0()->count;
    if (count >= 1) {
        do {
            int shift = func_020498f0()->arr_2d0[i];
            i++;
            result |= (1 << shift);
        } while (i <= func_020498f0()->count);
    }
    return result;
}
