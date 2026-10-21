typedef unsigned short u16;
typedef unsigned char u8;
typedef struct Card {
    u16 id;
    u16 side:1;
    u16 unused2:13;
    u16 flipped:1;
    u16 unused3:1;
    u16 unused4:5;
    u16 active:1;
    u16 unused5:10;
    u16 pad[9];
    u16 effect;
    u16 owner:1;
    u16 unused6:15;
} Card;
struct Node;
struct node;
struct Header { u16 id; u16 side:1; u16 pad:5; u16 kind:6; u16 rest:4; };
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c848c(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e276c(int self, int a, int b, int c);
int func_ov002_02237434(Card *self) {
    int a, b;
    int pair;
    if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
        pair = func_ov002_0223de94((struct node *)self, 0);
        a = (u8)pair;
        pair = (u16)pair;
        b = (u8)(pair >> 8);
        if (func_ov002_0225764c((int)self, a, b)) {
            func_ov002_021df818(self, 1 - self->side, func_ov002_021c848c(a, b) / 2);
        }
    }
    if (((struct Header *)self)->kind != 0x23) {
        func_ov002_021e276c(self->side, self->id, 1, 0);
    }
    return 0;
}



