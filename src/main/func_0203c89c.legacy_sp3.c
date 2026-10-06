typedef struct {
    char          _0[0x9];
    unsigned char level;
    char          _a[0xa];
    unsigned char f14;
    unsigned char f15;
    unsigned char max_level;
} prof_0203c89c_t;

typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char _2[0x2];
} player_0203c89c_t;

typedef struct {
    char              _0[0x444];
    player_0203c89c_t players[0xc];
    char              _474[0x899];
    unsigned char     mode;
    char              _d0e[0x5];
    unsigned char     self;
} game_0203c89c_t;

extern void *func_0203c900(int a0);
extern unsigned int func_0203c814(unsigned int x);

void func_0203c89c(unsigned char level) {
    prof_0203c89c_t *p = func_0203c900(0x1);
    game_0203c89c_t *g = func_0203c900(0x10);

    p->level = level;
    if (level >= 0x10) {
        return;
    }
    if (level > p->max_level) {
        p->max_level = level;
        if (level > 7) {
            p->f15 = func_0203c814(g->mode);
            p->f14 = g->players[g->self].f0;
        }
    }
}
