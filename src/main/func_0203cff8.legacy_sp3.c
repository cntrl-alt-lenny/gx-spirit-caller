typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char level;
    unsigned char flags;
} player_0203cff8_t;

typedef struct {
    unsigned short f0;
    unsigned short info;
    unsigned char  mac[6];
    unsigned short len;
    char           _c[0xb4];
} entry_0203cff8_t;

typedef struct {
    char              _0[0x444];
    player_0203cff8_t players[0xb];
    entry_0203cff8_t  entries[0xb];
} game_0203cff8_t;

static inline int GetLevel_0203cff8(int info) {
    unsigned char level;

    if (info & 2) {
        level = info >> 2;
    } else {
        level = (info >> 2) + 0x19;
    }
    return level;
}

extern void Copy32(void *src, void *dst, unsigned int len);

void func_0203cff8(int idx, entry_0203cff8_t *rec, int flag, game_0203cff8_t *g) {
    entry_0203cff8_t *e = &g->entries[idx];
    player_0203cff8_t *p = &g->players[idx];
    unsigned char level = GetLevel_0203cff8(rec->info);

    if (level > p->level) {
        p->level = level;
        p->flags = (p->flags & ~0x7f) | (flag & 0x7f);
    }
    Copy32(rec, e, sizeof(entry_0203cff8_t));
}
