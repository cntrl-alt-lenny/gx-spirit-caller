typedef unsigned short u16;
typedef struct { u16 id; u16 side : 1; } Obj;
typedef struct { unsigned int id : 13; char pad[16]; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_021e276c(int side, int a, int b, int c);
int func_ov002_02212d98(Obj *self) {
    unsigned int side = 1 - self->side;
    unsigned int mask = 0;
    int i;
    char *base = data_ov002_022cf16c + (side & 1) * 0x868;
    Card *cards = (Card *)(base + 0x94);
    char *p = base + 0x64;
    for (i = 5; i < 10; i++, cards++, p += 20) {
        unsigned int id = cards->id;
        if (*(u16 *)(p + 0x38) != 0 && id == 0x1102)
            mask |= 1 << (i + (side << 4));
    }
    if (func_ov002_021de408((int)self, mask)) {
        int who = self->side;
        unsigned int mode = *(int *)(data_ov002_022d016c + 0xcec) != who;
        if (*(int *)(data_ov002_022d016c + 0xcec) == who && *(int *)(data_ov002_022d016c + 0xcf8) == 4)
            mode = 2;
        { unsigned char nibble = mode & 15; unsigned int flags = (nibble << 4) | 1;
        func_ov002_021e276c(who, self->id, (u16)flags, 0); }
    }
    return 0;
}










