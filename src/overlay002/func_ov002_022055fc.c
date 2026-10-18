typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short       : 5;
    unsigned short kind : 6;
    unsigned short       : 4;
    unsigned int pad[4];
    unsigned int idx : 9;
    unsigned int side : 1;
    unsigned int : 9;
    unsigned int mode : 4;
    unsigned int : 9;
} CardA;

typedef struct {
    unsigned int id : 13;
    unsigned int side : 1;
    unsigned int : 18;
} CardB;

extern CardB *func_ov002_021b9b64(unsigned int idx);
extern int func_0202e234(unsigned int id);

int func_ov002_022055fc(CardA *a0)
{
    CardB *b;

    if (a0->kind == 0x16) {
        b = func_ov002_021b9b64(a0->idx);
        if (b == 0) {
            return 0;
        }
        if (a0->side == a0->flag0) {
            return 0;
        }
        if (b->side != 1 - a0->flag0) {
            return 0;
        }
        if (a0->mode != 0xe) {
            return 0;
        }
        return func_0202e234(b->id) != 0;
    }
    return 0;
}
