typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char _2[0x2];
} player_0203e2f0_t;

typedef struct {
    char              _0[0x444];
    player_0203e2f0_t players[0xb];
    char              _470[0x89c];
    unsigned char     mode : 4;
    unsigned char     _4 : 2;
    unsigned char     link : 2;
    unsigned char     _d0d;
    unsigned char     state;
    char              _d0f[0x4];
    unsigned char     self;
} game_0203e2f0_t;

extern void *func_0203c900(int a0);
extern int func_0207b5f8(void);
extern void func_0203e9ac(int mode);
extern int func_0207bc20(void);
extern void func_0207b888(void);
extern void func_0207b62c(void);
extern void func_0203c85c(int a0);

int func_0203e2f0(void) {
    game_0203e2f0_t *g = func_0203c900(0x10);
    unsigned int r = 9;

    switch (func_0207b5f8()) {
    case 3:
        r = g->state;
        if (g->link == 1) {
            g->players[g->self].f0 = 0;
            r = 7;
        } else if (r >= 3 && r <= 5) {
            func_0203e9ac(r);
        }
        break;
    case 6:
        func_0207bc20();
        break;
    case 9:
        func_0207b888();
        break;
    case 12:
        func_0207b62c();
        func_0203c85c(4);
        r = 0x11;
        break;
    case 11:
        func_0203c85c(0);
        r = 0x11;
        break;
    }
    return r;
}
