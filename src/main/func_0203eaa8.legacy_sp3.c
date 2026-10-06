typedef struct {
    char           _0[0xd16];
    unsigned short mask;
} game_0203eaa8_t;

extern void *func_0203c900(int a0);

signed char func_0203eaa8(int k) {
    game_0203eaa8_t *g = func_0203c900(0x10);
    unsigned char i;
    unsigned char n;
    unsigned int mask = g->mask;

    if (mask == 0) {
        return -1;
    }
    for (i = 0, n = 0; i < 0xd; i++) {
        if (mask & (1 << i)) {
            if (n == k) {
                return i;
            }
            n++;
        }
    }
    return -1;
}
