typedef union {
    unsigned short raw;
    struct {
        unsigned short player : 1;
        unsigned short kind : 5;
        unsigned short index : 8;
        unsigned short unused : 2;
    } bits;
} CardRef;
typedef struct {
    char pad[0xc6a];
    unsigned short a;
    unsigned short b;
    char pad2[0x1e];
    int first[3];
    int second[3];
} Obj;
extern int func_ov002_022b867c(Obj *p, int player, int kind, int index, int *out);
int func_ov002_022b8430(Obj *p, unsigned short a, unsigned short b) {
    p->a = *(volatile unsigned short *)&a;
    func_ov002_022b867c(p, ((CardRef *)&a)->bits.player, ((CardRef *)&a)->bits.kind, ((CardRef *)&a)->bits.index, p->first);
    p->b = *(volatile unsigned short *)&b;
    func_ov002_022b867c(p, ((CardRef *)&b)->bits.player, ((CardRef *)&b)->bits.kind, ((CardRef *)&b)->bits.index, p->second);
    return 1;
}



