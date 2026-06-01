/* func_ov002_021d86fc: post a 0x29 event (high bit set when arg0) via
 * 021d479c, advancing arg3. */
typedef unsigned short u16;

extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021d86fc(int arg0, int arg1, int arg2, int arg3) {
    int v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x29), arg1, arg2, (u16)(arg3 + 1));
}
