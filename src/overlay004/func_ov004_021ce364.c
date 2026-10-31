typedef struct Record {
    unsigned char pad[0x48];
    int active;
    unsigned value;
    unsigned char a, b, c, d;
} Record;
typedef struct Bank {
    unsigned char pad[0x3d28];
    Record rec[60];
} Bank;
extern Bank data_ov004_0220b500;
extern Record data_ov004_0220f228[];
extern int func_02052cdc(void *a, void *b);
/* The existing void definition omits the pointer passed by this caller. */
extern int func_02053170();
extern void func_02094688(const void *src, void *dst, unsigned size);
int func_ov004_021ce364(Record *p) {
    int i;
    Bank *base = &data_ov004_0220b500;
    Record *q = data_ov004_0220f228;

    int best;
    unsigned min;
    for (i = 0; i < 60; i++, q++) {
        if (func_02052cdc(p, q)) {
            p->a = base->rec[i].a;
            p->b = base->rec[i].b;
            p->c = base->rec[i].c;
            p->value = base->rec[i].value;
            func_02094688(p, &base->rec[i], 0x54);
            return i;
        }
    }
    q = base->rec;
    for (i = 0; i < 60; i++, q++) {
        if (!func_02053170(q)) break;
    }
    if (i < 60) {
        p->active = 1;
        func_02094688(p, &base->rec[i], 0x54);
        return i;
    }
    best = -1;
    min = 0xffffffff;
    q = (Record *)base;
    for (i = 0; i < 60; i++, q++) {
        unsigned value = *(unsigned *)((unsigned char *)q + 0x3d34);
        if (value < min) {
            best = i;
            min = value;
        }
    }
    p->active = 1;
    func_02094688(p, &base->rec[best], 0x54);
    return best;
}



