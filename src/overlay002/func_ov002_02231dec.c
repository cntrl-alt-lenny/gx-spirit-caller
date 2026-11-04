typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    u16 kind;
    u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
    u16 pad:6; u16 value:9; u16 end:1;
    u16 count;
    u16 arr8[5]; u16 f18;
};
struct Node;
struct Card { unsigned id:13; unsigned bit:1; unsigned pad:8; unsigned sub:8; unsigned end:2; char tail[16]; };
struct Player { char pad[48]; struct Card cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);
extern void func_ov002_0226b11c(int unused0, int unused1);
int func_ov002_02231dec(struct node *self) {
    int side = self->owner;
    int off = (side & 1) * 0x868;
    int row = self->slot * 20;
    struct Card *card = (struct Card *)(data_ov002_022cf16c + off + 0x30 + row);
    int a, b;
    if (self->value != card->sub * 2 + card->bit) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + row) == 0) return 0;
    if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
        int pair = func_ov002_0223de94(self, 0);
        a = (u8)pair;
        b = (u8)((u16)pair >> 8);
        if (func_ov002_0225764c((int)self, a, b)) {
            func_ov002_021d59cc(a, b, (u16)((u8)self->owner | ((u8)self->slot << 8)), 6, self->owner);
            func_ov002_0226b11c(a, b);
        }
    }
    return 0;
}

