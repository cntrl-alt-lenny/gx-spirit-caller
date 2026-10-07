typedef struct {
    char pad[0xb4];
    unsigned short count;
} Gate_0200a2f4;

typedef struct {
    unsigned short kind : 8;
    unsigned short rest : 8;
    char pad[4];
} Entry_0200a2f4;

extern Gate_0200a2f4 data_0210693c;
extern char data_02104f4c[];
extern Entry_0200a2f4 data_02106810[];

Entry_0200a2f4 *func_0200a2f4(int a0) {
    Gate_0200a2f4 *g = &data_0210693c;
    char *ring = data_02104f4c;
    Entry_0200a2f4 *tbl = data_02106810;
    int idx;
    Entry_0200a2f4 *e;

    if (g->count == 0) {
        return 0;
    }
    if (a0 >= *(unsigned short *)(ring + 0x1aa4)) {
        return 0;
    }
    idx = (*(unsigned short *)(ring + 0x1aa6) + (0x4f - a0)) % 0x50;
    e = &tbl[idx];
    if (e->kind == 0) {
        return 0;
    }
    return e;
}
