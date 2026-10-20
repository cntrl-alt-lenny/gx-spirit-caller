struct Ov002Self;
struct Duel { char pad[0xcec]; int side; };
extern struct Duel data_ov002_022d016c;
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
int func_ov002_0221af10(struct Ov002Self *self) {
    int side;
    for (int j, i = 0; i < 2; i++) {
        side = data_ov002_022d016c.side ^ i;
        for (j = 0; j < 5; j++) {
            if (func_ov002_0225764c((int)self, side, j)) {
                func_ov002_021d6808(self, side, j, 0, 0);
            }
        }
    }
    return 0;
}
