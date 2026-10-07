typedef struct {
    unsigned short kind : 8;
    unsigned short rest : 8;
    unsigned short f2;
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
    unsigned short rest2 : 13;
} Entry_0200a3b8;

extern Entry_0200a3b8 data_02106810[];

int func_0200a3b8(void) {
    int r = 0;
    Entry_0200a3b8 *e;
    int i;

    e = data_02106810;
    for (i = 0; i < 0x50; i++, e++) {
        if (e->kind != 0) {
            if (e->b2 == 0) {
                e->b2 = 1;
                r = 1;
            }
        }
    }
    return r;
}
