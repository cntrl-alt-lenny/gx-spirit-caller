/* func_ov002_021df780: post a 0x25 event (kind 2) via 021d479c, skipping 0 and
 * clamping arg1 to 0xFFFF. */
typedef unsigned short u16;
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021df780(int arg0, int arg1) {
    int v;
    if (arg1 == 0)
        return;
    if (arg1 > 0xFFFF)
        arg1 = 0xFFFF;
    v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x25), (u16)arg1, 2, 0);
}
