typedef struct {
    unsigned char f0, kind, level, flags;
} Player;
typedef struct { unsigned char bytes[0xc0]; } Entry;
/* Assembly implementations use r0-r2 for these three arguments. */
extern void Copy32(void *src, void *dst, unsigned int len);
extern void Fill32(unsigned int value, void *dst, unsigned int len);
void func_0203cef8(int idx, char *g) {
    Player tempPlayer;
    Entry tempEntry;
    int prev;
    Player *players = (Player *)(g + 0x444);
    Entry *entries = (Entry *)(g + 0x470);
    for (prev = idx - 1; prev >= 0; prev--) {
        if (players[idx].level < players[prev].level) break;
        Copy32(&players[prev], &tempPlayer, sizeof(Player));
        Copy32(&players[idx], &players[prev], sizeof(Player));
        Copy32(&tempPlayer, &players[idx], sizeof(Player));
        Copy32(&entries[prev], &tempEntry, sizeof(Entry));
        Copy32(&entries[idx], &entries[prev], sizeof(Entry));
        Copy32(&tempEntry, &entries[idx], sizeof(Entry));
        idx = prev;
    }
    Fill32(0, &players[10], sizeof(Player));
    Fill32(0, &entries[10], sizeof(Entry));
}


