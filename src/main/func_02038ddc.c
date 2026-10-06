typedef struct {
    char           pad[0x4];
    int            field4;
    int            f8;
    int            fc;
    int            f10;
    char           _14[0x40];
    unsigned short f54;
    unsigned char  f56;
    char           _57[0x2];
    signed char    refs;
    unsigned char  f5a;
    char           _5b;
} Elem02038dac;

extern Elem02038dac data_0219d00c[];

Elem02038dac *func_02038ddc(int key) {
    int i;
    Elem02038dac *p = data_0219d00c;
    Elem02038dac *slot = 0;

    for (i = 0x1f; i >= 0; p--, i--) {
        if (p->field4 == key) {
            p->refs++;
            return p;
        }
        if (p->field4 == 0) {
            slot = p;
        }
    }
    if (slot != 0) {
        slot->refs = 1;
        slot->f8 = 0;
        slot->f5a = 0;
        slot->f10 = 0;
        slot->fc = 0;
        slot->f56 = 8;
        slot->f54 = 0;
    }
    return slot;
}
