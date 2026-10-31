typedef struct {
    char _0[0xd0b];
    unsigned char lo : 4;
    unsigned char retries : 4;
    char _d0c[0x5];
    signed char slot;
    unsigned char count;
    char _d13[0x3];
    unsigned short mask;
} game_0203e400_t;
typedef struct {
    char _0[0xd0b];
    unsigned char lo : 4;
    unsigned char retries : 4;
    char _d0c[0x5];
    unsigned char slot;
    char _d12[0x3];
    unsigned char fd15;
} game_0203e870_t;
extern int func_0203e254(int a0);
extern int func_0203e400(game_0203e400_t *g);
extern int func_0203e870(game_0203e870_t *g);
extern void func_0203e9ac(int mode);
int func_0203e540(game_0203e400_t *g, int state) {
    switch (state) {
    case 3:
        if (g->count != 0 || g->mask != 0) {
            if (func_0203e254(1) != 0) {
                state = 4;
            } else {
                state = func_0203e400(g);
            }
        } else {
            if (g->retries >= 1) {
                state = 6;
            } else {
                state = func_0203e870((game_0203e870_t *)g);
            }
        }
        break;
    case 4:
        state = func_0203e400(g);
        break;
    case 5:
        if (g->retries >= 1) {
            state = 6;
        } else {
            state = func_0203e870((game_0203e870_t *)g);
        }
        break;
    }
    func_0203e9ac(state);
    return state;
}
