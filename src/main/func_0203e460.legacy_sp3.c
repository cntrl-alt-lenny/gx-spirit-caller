typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char level;
    unsigned char flags;
} player_0203e460_t;

typedef struct {
    char              _0[0x444];
    player_0203e460_t players[0xb];
    char              _470[0x89e];
    unsigned char     state;
    char              _d0f[0x3];
    unsigned char     count;
    unsigned char     self;
} game_0203e460_t;

extern void func_0203c85c(int a0);
extern int func_0207bc20(void);

int func_0203e460(game_0203e460_t *g, int r) {
    unsigned int i;
    unsigned int count;

    if (r == 0x11) {
        return r;
    }
    count = g->count;
    for (i = 0; i < count; i = (unsigned char)(i + 1)) {
        if (g->players[i].f0 == 0) {
            break;
        }
    }
    if (r == 6) {
        if (count == i) {
            if (i == 0) {
                func_0203c85c(5);
            } else {
                func_0203c85c(6);
            }
            return 0x11;
        }
    } else {
        if (count == 0) {
            return r;
        }
        if (count == i) {
            return r;
        }
        if (g->players[i].level < 0x14) {
            return r;
        }
    }
    g->self = i;
    if (func_0207bc20() != 1) {
        g->state = r;
        r = 7;
    }
    return r;
}
