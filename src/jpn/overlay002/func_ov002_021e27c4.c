/* func_ov002_021e27c4: post a 0x4E event (high bit set when arg0) via 021d479c,
 * payload = the d016c +0xCE4 dword split low/high. */
typedef unsigned short u16;
extern void func_ov002_021d46ac(u16 a, u16 b, u16 c, u16 d);
extern char data_ov002_022d008c[];

void func_ov002_021e27c4(int arg0) {
    unsigned int g = *(unsigned int *)(data_ov002_022d008c + 0xCE4);
    int v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d46ac((u16)(v | 0x4E), (u16)g, (u16)(g >> 16), 0);
}
