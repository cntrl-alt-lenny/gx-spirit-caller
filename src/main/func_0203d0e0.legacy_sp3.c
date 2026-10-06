typedef struct {
    unsigned short f0;
    unsigned short info;
    unsigned char  mac[6];
    unsigned short len;
    char           _c[0xb4];
} entry_0203d0e0_t;

typedef struct {
    char             _0[0x470];
    entry_0203d0e0_t entries[0xb];
    char             _cb0[0x62];
    unsigned char    count;
} game_0203d0e0_t;

extern void func_0203d078(unsigned char kind, entry_0203d0e0_t *rec, int flag, game_0203d0e0_t *g);
extern void func_0203cff8(int idx, entry_0203d0e0_t *rec, int flag, game_0203d0e0_t *g);

int func_0203d0e0(int kind, entry_0203d0e0_t *rec, int flag, game_0203d0e0_t *g) {
    unsigned char *mac;
    int i;
    int found = -1;

    for (i = 0; i < g->count; i++) {
        mac = g->entries[i].mac;
        if (rec->mac[0] == mac[0] && rec->mac[1] == mac[1] && rec->mac[2] == mac[2] &&
            rec->mac[3] == mac[3] && rec->mac[4] == mac[4] && rec->mac[5] == mac[5]) {
            found = i;
            break;
        }
    }
    if (found == -1) {
        func_0203d078(kind, rec, flag, g);
        found = 10;
        if (g->count < 10) {
            g->count++;
        }
    } else {
        func_0203cff8(found, rec, flag, g);
    }
    return found;
}
