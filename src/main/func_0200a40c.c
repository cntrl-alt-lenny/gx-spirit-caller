typedef struct {
    unsigned short kind : 8;
    unsigned short rest : 8;
    unsigned short f2;
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
    unsigned short rest2 : 13;
} Entry_0200a40c;

extern Entry_0200a40c data_02106810[];

int func_0200a40c(void) {
    int r = 0;
    Entry_0200a40c *e;
    int i;

    e = data_02106810;
    for (i = 0; i < 0x50; i++, e++) {
        if (e->kind != 0) {
            if (e->b1 == 0) {
                r = 1;
                break;
            }
        }
    }
    return r;
}
