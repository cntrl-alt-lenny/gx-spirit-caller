typedef struct {
    char _0[0xa];
    unsigned short len;
    unsigned char name[0x20];
    unsigned short flags;
} entry_0203d2e8_t;
typedef struct {
    char _0[0xa];
    unsigned short len;
    unsigned char name[0xb4];
} entry_t;
typedef struct {
    unsigned char f0, kind, level, flags;
} player_t;
typedef struct {
    char _0[0x444];
    player_t players[11];
    entry_t entries[11];
    char _cb0[0x62];
    unsigned char count;
} game_t;
extern int func_0203d2e8(entry_0203d2e8_t *rec);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
int func_0203d1c0(entry_0203d2e8_t *rec, game_t *g) {
    int r;
    int i;
    game_t *cursor;
    unsigned char *name;
    unsigned int len;
    int count;
    unsigned char *key;
    if (rec->len == 0x20) {
        r = func_0203d2e8(rec);
        if (r > 0) return r;
    }
    count = g->count;
    i = 0;
    if (i < count) {
        len = rec->len;
        cursor = g;
        name = g->entries[0].name;
        key = rec->name;
        do {
            if (len == cursor->entries[0].len && func_020ab054(key, name, len) == 0)
                return g->players[i].kind;
            i++;
            cursor = (game_t *)((unsigned char *)cursor + 0xc0);
            name += 0xc0;
        } while (i < count);
    }
    return -1;
}

