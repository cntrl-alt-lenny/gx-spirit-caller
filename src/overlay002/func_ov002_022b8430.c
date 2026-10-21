typedef union Packed {
    volatile unsigned short raw;
    struct {
        unsigned short side : 1;
        unsigned short kind : 5;
        unsigned short index : 8;
        unsigned short unused : 2;
    } bits;
} Packed;
typedef struct Object {
    char pad[0xc6a];
    unsigned short a;
    unsigned short b;
    char pad2[0x1e];
    int pos1[3];
    int pos2[3];
} Object;
extern int func_ov002_022b867c(Object *, int, int, int, void *);
int func_ov002_022b8430(Object *p, Packed a, Packed b) {
    int side, kind, index;
    side = a.bits.side;
    kind = a.bits.kind;
    index = a.bits.index;
    p->a = a.raw;
    func_ov002_022b867c(p, side, kind, index, p->pos1);
    side = b.bits.side;
    kind = b.bits.kind;
    index = b.bits.index;
    p->b = b.raw;
    func_ov002_022b867c(p, side, kind, index, p->pos2);
    return 1;
}

