extern struct { int player; int phase; int result; } data_ov002_022cdc78;
extern unsigned short data_ov002_022cdc88[];
extern unsigned short data_ov002_022ce088[];
extern int data_ov002_022cd744[];
extern int func_ov002_021afaf0(void);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_022806a4(int a, int b, int c);
extern int func_ov002_02280714(int arg0, int arg1, int arg2, int limit);
extern int func_ov002_02280794(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_0228083c(int player, int id);
extern int func_ov002_0229ade0(int command, ...);
/* The original supplies only two arguments to the four-argument thunk. */
extern int func_ov002_0229cd5c();

void func_ov002_021af9d0(int player, int phase, int card, int arg) {
    data_ov002_022cdc78.player = player;
    data_ov002_022cdc78.phase = phase;
    data_ov002_022cdc78.result = 0;
    func_ov002_0229cd5c((int)data_ov002_022cdc88, 0x200);
    func_ov002_0229cd5c((int)data_ov002_022ce088, 0x100);
    func_ov002_0225368c(player, card, arg);
    if (phase >= 6 && data_ov002_022cd744[player] == 1) {
        if (phase == 6 || phase == 0x4a) {
            func_ov002_022806a4(player, card, arg);
        } else if (phase > 6 && phase <= 0x26) {
            func_ov002_02280714(player, card, arg, func_ov002_021afaf0());
        } else if (phase > 0x27 && phase <= 0x48) {
            func_ov002_02280794(player, card, arg, func_ov002_021afaf0());
        } else if (phase >= 0x4b) {
            func_ov002_0228083c(player, card);
        }
    } else {
        func_ov002_0229ade0(0x32, player, phase, 0);
    }
}
