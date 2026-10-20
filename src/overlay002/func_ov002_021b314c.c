extern unsigned short data_ov002_022cf1a6[];
extern int func_ov002_021c1ad0(int player, int kind);
extern int func_ov002_021c1d4c(int player, int kind);
extern int func_ov002_021b2ebc(int myPlayer, int idx, int target, int flag3, int mask4, int mask5);
void func_ov002_021b314c(int arg0, int arg1, int arg2) {
    int a = func_ov002_021c1ad0(arg0, arg1);
    int b = func_ov002_021c1d4c(arg0, arg1);
    func_ov002_021b2ebc(arg0, *(unsigned short *)((char *)data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20), arg2, 1, a, b);
}
