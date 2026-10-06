typedef struct {
    char          _0[0xd0b];
    unsigned char lo : 4;
    unsigned char retries : 4;
    char          _d0c[0x5];
    unsigned char slot;
    char          _d12[0x3];
    unsigned char fd15;
} game_0203e870_t;

extern int func_0203e254(int a0);

int func_0203e870(game_0203e870_t *g) {
    g->fd15 = 0;
    g->retries = g->retries + 1;
    func_0203e254(0);
    g->slot = 1;
    return 3;
}
