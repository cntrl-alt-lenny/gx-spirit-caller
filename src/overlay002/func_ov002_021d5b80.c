/* func_ov002_021d5b80: when 021b3ecc(arg0, arg1, arg2) holds, post a 0x37
 * event via 021d479c (high bit from arg0, arg1 byte | 0x100, arg2, arg3). */
typedef unsigned short u16;

extern int func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3) {
    int v;
    if (func_ov002_021b3ecc(arg0, arg1, arg2) == 0)
        return;
    v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x37), (u16)((arg1 & 0xFF) | 0x100), (u16)arg2, (u16)arg3);
}
