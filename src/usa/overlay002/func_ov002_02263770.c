/* func_ov002_02263770: for k in [0,2), player = self^k; query
 * func_ov002_021b4040(player,11,0x18bc); on a positive result, pack
 * (bit0<<31)|(flag<<24)|0xa4f18bc (flag = bit0!=player) and forward to
 * func_ov002_021e2fc4 + func_ov002_021d5a90, returning 0. Falls off
 * returning 1 if neither player yields a positive result. */
extern int func_ov002_021b4040(int player, int a, int b);
extern void func_ov002_021e2fc4(int packed, int lo16, int zero);
extern void func_ov002_021d5a90(int player, int a, int b, int c);

int func_ov002_02263770(int self) {
    int k;

    for (k = 0; k < 2; k++) {
        int player = self ^ k;
        int result = func_ov002_021b4040(player, 11, 0x18bc);
        if (result > 0) {
            int bit0 = result & 1;
            int flag = (bit0 != player) ? 1 : 0;
            int signBit = bit0 << 31;
            int lo16 = (unsigned)(result << 16) >> 16;
            int flagBit = flag << 24;
            int packed;
            signBit = signBit & 0x80000000;
            signBit = signBit | 0xa000000;
            flagBit = flagBit & 0x1000000;
            packed = signBit | flagBit;
            packed = packed | 0x4f18bc;
            func_ov002_021e2fc4(packed, lo16, 0);
            func_ov002_021d5a90(player, 11, 0x18bc, 0);
            return 0;
        }
    }
    return 1;
}
