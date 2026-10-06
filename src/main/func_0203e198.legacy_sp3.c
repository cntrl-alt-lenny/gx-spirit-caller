typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char _2;
    unsigned char len;
    unsigned char name[0x20];
} item_0203e198_t;

typedef struct {
    char            _0[0x300];
    item_0203e198_t items[0x2f];
    char            _99c[0x370];
    unsigned char   mode : 4;
    unsigned char   _hi : 4;
} game_0203e198_t;

extern unsigned char data_020bec44[];
extern unsigned char func_0203df88(game_0203e198_t *g);
extern void func_02094688(void *src, void *dst, int n);

unsigned char func_0203e198(game_0203e198_t *g) {
    item_0203e198_t *it = g->items;
    unsigned char n = func_0203df88(g);

    it += n;

    if (g->mode == 0 || g->mode == 6) {
        func_02094688(data_020bec44, it->name, 8);
        it->len = 8;
        it->kind = 8;
        n++;
    }
    return n;
}
