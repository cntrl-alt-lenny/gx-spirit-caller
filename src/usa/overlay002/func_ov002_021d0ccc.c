/* func_ov002_021d0ccc: if data_ov002_022ce870.f810 is already set, bail;
 * otherwise fire the phase-2 flag (carrying f2 as the implicit "set"
 * argument), reset both players' band state, post two 0x14/0xd commands,
 * and clear f80c. */
typedef struct {
    char _pad0[2];
    unsigned short f2;
    char _pad1[0x808];
    int f80c;
    int f810;
} S021d0dac;

extern S021d0dac data_ov002_022ce870;
extern void func_ov002_021c9a10(int bit, int set);
extern void func_ov002_021ba6e4(int player);
extern int func_ov002_0229acd0(int cmd, int a, int b, int c);

void func_ov002_021d0ccc(void) {
    unsigned short f2 = data_ov002_022ce870.f2;

    if (data_ov002_022ce870.f810 != 0)
        return;

    func_ov002_021c9a10(2, f2);
    func_ov002_021ba6e4(0);
    func_ov002_021ba6e4(1);
    func_ov002_0229acd0(0x14, 0, 0xd, 0);
    func_ov002_0229acd0(0x14, 1, 0xd, 0);
    data_ov002_022ce870.f80c = 0;
}
