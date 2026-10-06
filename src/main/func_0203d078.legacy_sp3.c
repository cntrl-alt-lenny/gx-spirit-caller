typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char level;
    unsigned char flags;
} player_0203d078_t;

typedef struct {
    unsigned short f0;
    unsigned short info;
    unsigned char  mac[6];
    unsigned short len;
    char           _c[0xb4];
} entry_0203d078_t;

typedef struct {
    char              _0[0x444];
    player_0203d078_t players[0xb];
    entry_0203d078_t  entries[0xb];
} game_0203d078_t;

static inline unsigned char GetLevel_0203d078(int info) {
    unsigned char level;

    if (info & 2) {
        level = info >> 2;
    } else {
        level = (info >> 2) + 0x19;
    }
    return level;
}

extern void Copy32(void *src, void *dst, unsigned int len);

void func_0203d078(unsigned char kind, entry_0203d078_t *rec, int flag, game_0203d078_t *g) {
    entry_0203d078_t *e = &g->entries[10];
    player_0203d078_t *p = &g->players[10];
    p->kind = kind;
    p->level = GetLevel_0203d078(rec->info);
    p->flags = (p->flags & ~0x7f) | (flag & 0x7f);
    Copy32(rec, e, sizeof(entry_0203d078_t));
}
