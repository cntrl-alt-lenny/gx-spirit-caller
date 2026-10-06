typedef struct {
    char          _0[0x80];
    unsigned char data[0x51];
    unsigned char tag[0x15];
    unsigned char type : 2;
    unsigned char _bits : 6;
    char          _e7[0x19];
} rec_0203d5b0_t;

typedef struct {
    char           _0[0xa];
    unsigned short len;
    unsigned char  name[0xb4];
} entry_0203d5b0_t;

typedef struct {
    rec_0203d5b0_t   recs[3];
    char             _300[0x170];
    entry_0203d5b0_t entries[0xb];
    char             _cb0[0x63];
    unsigned char    self;
} game_0203d5b0_t;

typedef struct {
    unsigned char type;
    unsigned char _1;
    unsigned char data[0x14];
    unsigned char f16;
} out_0203d5b0_t;

extern void func_02094688(void *src, void *dst, int n);
extern void func_0203f690(void *p, void *out);
extern void func_0203f718(void *arg0, void *arg1);

int func_0203d5b0(game_0203d5b0_t *g, int kind, out_0203d5b0_t *out) {
    rec_0203d5b0_t *r = g->recs;

    switch (kind) {
    case 2:
        r++;
    case 1:
        r++;
    case 0:
        out->type = r->type;
        func_02094688(r->data, out->data, 0x50);
        break;
    case 5:
        r++;
    case 4:
        r++;
    case 3:
        out->type = 1;
        func_02094688(r->tag, out->data, 0x14);
        out->f16 = 0;
        break;
    case 6:
        out->type = 2;
        func_0203f690(g->entries[g->self].name, out->data);
        break;
    case 7:
        out->type = 2;
        func_0203f718(g->entries[g->self].name, out->data);
        break;
    case 8:
    case 9:
        break;
    }
    return out->type != 0;
}
