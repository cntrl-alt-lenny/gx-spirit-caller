typedef struct {
    short f0;
    short f2;
    short f4;
    short f6;
} S8;

typedef struct {
    unsigned short active;
    unsigned short f2;
    S8             ch[0x10];
} group_020387c0_t;

extern group_020387c0_t data_0219b550[];
extern void func_020385d8(S8 *p, int v);

void func_020387c0(unsigned int idx) {
    group_020387c0_t *g = &data_0219b550[idx];

    g->active = 0;
    g->f2 = 0;
    for (idx = 0; idx < 0x10; idx++) {
        func_020385d8(&g->ch[idx], 0x7f);
    }
}
