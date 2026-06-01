/* func_ov002_021df73c: post a 0x26 event (high bit set when arg0) via
 * 021d479c, clamping arg1 to 0xFFFF. */
typedef unsigned short u16;

extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021df73c(int arg0, int arg1) {
    int v;
    if (arg1 > 0xFFFF)
        arg1 = 0xFFFF;
    v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x26), (u16)arg1, 0, 0);
}
