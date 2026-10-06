typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char level;
    unsigned char flag : 7;
    unsigned char ready : 1;
} player_0203def0_t;

typedef struct {
    char           _0[0x36];
    unsigned short f36;
    char           _38[0x88];
} entry_0203def0_t;

typedef struct {
    char              _0[0x444];
    player_0203def0_t players[0xb];
    entry_0203def0_t  entries[0xb];
    char              _cb0[0x62];
    unsigned char     count;
} game_0203def0_t;

unsigned char func_0203def0(game_0203def0_t *g) {
    int i;
    unsigned char n;

    n = 0;
    for (i = 0; i < g->count; i++) {
        if (g->players[i].f0 == 0 && g->entries[i].f36 - 1 != g->players[i].flag) {
            g->players[i].ready = 0;
            n++;
        } else {
            g->players[i].ready = 1;
        }
    }
    return n;
}
