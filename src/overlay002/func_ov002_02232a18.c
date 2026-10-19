typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side:1;
    u16 slot:5;
    u16 rest:10;
    u16 pad4:2;
    u16 flag:1;
    u16 pad5:3;
    u16 id:9;
    u16 pad6:1;
} Self;
struct node;
struct Ov002Self;
typedef struct {
    unsigned int pad:13;
    unsigned int low:1;
    unsigned int pad2:8;
    unsigned int high:8;
    unsigned int pad3:2;
    unsigned int other[4];
} Entry;
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(Self *, int, int *);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021d9144(int arg0, int arg1, int arg2);
extern int func_ov002_021b9bd4(int, int);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02232a18(Self *self) {
    int lo, hi;
    int pair;
    Entry *entry;
    if (self->flag == 0 && func_ov002_0223df38(self, 0, 0) != 0) {
        pair = func_ov002_0223de94((struct node *)self, 0);
        lo = pair & 0xff;
        hi = ((u16)pair >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, lo, hi) != 0)
            func_ov002_021d6808((struct Ov002Self *)self, lo, hi, 0, 1);
    }
    entry = (Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
    if (self->id != entry[self->slot].high * 2 + entry[self->slot].low)
        return 0;
    func_ov002_021d9144(self->side, self->slot, 1);
    if (func_ov002_021b9bd4(self->side, self->slot) + 1 >= 3)
        func_ov002_021de480(self->side, self->slot, 0, 0);
    return 0;
}

