typedef unsigned short u16;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
typedef struct Card { u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1; u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15; } Card;
struct Row { unsigned id:13; unsigned rest:19; char tail[16]; };
struct SideRow { char prefix[48]; struct Row row; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_0202b8f0(int unused0);
/* The original does not set the unused argument of these hubs. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_0220e518(void *self);
extern int func_ov002_021df818(Card *card, int side, int amount);
int func_ov002_02239f10(Card *self) {
    int packed, player, row, amount;
    unsigned base;
    if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
        packed = func_ov002_0223de94((struct node *)self, 0);
        player = packed & 0xff;
        row = ((int)(u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, player, row) != 0) {
            base = (player & 1) * 0x868 + (unsigned)data_ov002_022cf16c;
            amount = func_0202b8f0(((struct SideRow *)(base + row * 0x14))->row.id) / 2;
            func_ov002_021e2b3c();
            if (func_ov002_0220e518(self) != 0) {
                func_ov002_021df818(self, 1 - self->side, amount);
            }
            func_ov002_021e2c5c();
            return 0;
        }
    }
    return 0;
}
