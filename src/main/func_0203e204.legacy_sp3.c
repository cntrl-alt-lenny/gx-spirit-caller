typedef struct {
    char          _0[0xc];
    unsigned char name[0x20];
} entry_0203e204_t;

typedef struct {
    char          _0[0xd0c];
    unsigned char mode : 4;
    unsigned char _hi : 4;
} game_0203e204_t;

extern unsigned char data_020bec44[];
extern void *func_0203c900(int a0);
extern int func_020ab054(void *a, void *h, unsigned int n);

int func_0203e204(entry_0203e204_t *rec) {
    game_0203e204_t *g = func_0203c900(0x10);

    if (g->mode == 0 || g->mode == 6) {
        if (func_020ab054(rec->name, data_020bec44, 8) == 0) {
            return 8;
        }
    }
    return 0;
}
