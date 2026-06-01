/* func_ov002_021d90fc: post a 0x3A event (high bit set when arg0) via 021d479c,
 * arg1 byte | 0x100, arg2 split low/high. */
typedef unsigned short u16;
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021d90fc(int arg0, int arg1, unsigned int arg2) {
    int v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x3A), (u16)((arg1 & 0xFF) | 0x100), (u16)arg2, (u16)(arg2 >> 16));
}
