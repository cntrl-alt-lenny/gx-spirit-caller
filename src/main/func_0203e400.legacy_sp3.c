typedef struct {
    char           _0[0xd0b];
    unsigned char  lo : 4;
    unsigned char  retries : 4;
    char           _d0c[0x5];
    signed char    slot;
    char           _d12[0x4];
    unsigned short mask;
} game_0203e400_t;

extern int func_0203e254(int a0);
extern signed char func_0203eaa8(int k);
extern int func_0203e870(game_0203e400_t *g);

int func_0203e400(game_0203e400_t *g) {
    if (g->mask != 0 && func_0203e254(2) != 0) {
        g->slot = func_0203eaa8(0);
        return 5;
    }
    if (g->retries >= 1) {
        return 6;
    }
    return func_0203e870(g);
}
