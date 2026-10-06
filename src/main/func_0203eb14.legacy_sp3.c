typedef struct {
    char           _0[0xd16];
    unsigned short mask;
} game_0203eb14_t;

extern void *func_0203c900(int a0);

void func_0203eb14(unsigned int n) {
    game_0203eb14_t *g = func_0203c900(0x10);

    if (n > 0xd) {
        n = 0xd;
    }
    g->mask |= 1 << (n - 1);
}
