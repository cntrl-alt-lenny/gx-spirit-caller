typedef struct {
    char               _0[0xcb0];
    unsigned long long tick;
    char               _cb8[0x59];
    signed char        slot;
} game_0203e95c_t;

extern char data_020bee7c[];
extern char data_020bee84[];
extern long long func_020930b0(void);
extern void func_0203e3d4(int a0, int a1, int a2, int a3);

int func_0203e95c(game_0203e95c_t *g) {
    g->tick = func_020930b0();
    g->slot = 0;
    g->tick = func_020930b0();
    func_0203e3d4((int)data_020bee7c, (int)data_020bee84, g->slot, 0x200000);
    return 3;
}
