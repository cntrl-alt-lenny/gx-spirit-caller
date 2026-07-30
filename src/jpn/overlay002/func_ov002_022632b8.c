/* func_ov002_022632b8: for i=0,1, id=player^i; if func_ov002_021b4040(id,11,
 * arg1) > 0, arg-pack (bit31=id&1, |0x4e0000|0xa000000|u16(arg1)) to
 * func_ov002_021e2fc4 with u16(result), then func_ov002_021d5a90(id,11,
 * arg1,0), return 0. If neither i matches, return 1. */
extern int func_ov002_021b4040(int arg0, int arg1, int arg2);
extern int func_ov002_021e2fc4(int arg0, int arg1, int arg2);
extern void func_ov002_021d5a90(int arg0, int arg1, int arg2, int arg3);

int func_ov002_022632b8(int player, int arg1) {
    int i;

    for (i = 0; i < 2; i++) {
        int id = player ^ i;
        int result = func_ov002_021b4040(id, 11, arg1);
        if (result > 0) {
            unsigned int packed = ((unsigned)(id << 31) & 0x80000000u) | 0x4e0000 | 0xa000000 | (unsigned short)arg1;
            func_ov002_021e2fc4(packed, (unsigned short)result, 0);
            func_ov002_021d5a90(id, 11, arg1, 0);
            return 0;
        }
    }
    return 1;
}
