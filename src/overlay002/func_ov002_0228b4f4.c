typedef unsigned short u16;
typedef unsigned char u8;

struct Self { u16 f0; u16 bit0 : 1; };
struct List { u16 f0; u16 f2; u16 f4; u16 count : 8; };

extern int func_ov002_0223de94(struct List *list, int idx);
extern int func_ov002_021b9ecc(int player, int kind);
extern int func_0202e258(void);
extern int func_0202e42c(int x);
extern char data_ov002_022cf16c[];

struct Row {
    char pad[0x38];
    u16 f38;
    u16 pad3a;
    unsigned int f3c;
    unsigned int f40;
};

int func_ov002_0228b4f4(struct Self *self, struct List *list)
{
    int i;

    if (list == 0) {
        return 0;
    }
    for (i = 0; i < list->count; i++) {
        int v = func_ov002_0223de94(list, i);
        int player = v & 0xff;
        int kind = ((u16)v >> 8) & 0xff;

        if (player == self->bit0 && kind <= 10) {
            int c = func_ov002_021b9ecc(player, kind);
            if (func_0202e258() == 0 && func_0202e42c(c) != 0) {
                struct Row *row = (struct Row *)(data_ov002_022cf16c + (player & 1) * 0x868 + kind * 20);
                if ((row->f38 & ~((row->f40 >> 6) & 1)) & ~(((row->f40 >> 1) | (row->f40 >> 2)) & 1)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
