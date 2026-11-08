typedef unsigned short u16;
typedef struct { u16 id; u16 side:1; u16 rest:15; } Card;
struct Node {
 u16 id;
 u16 side:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
 char pad[16];
 unsigned low:9; unsigned player:1; unsigned index:4; unsigned active:1; unsigned disabled:1; unsigned high:16;
};
struct Entry { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
int func_ov002_02202f78(struct Node *self) {
 if ((u16)(self->category + 0xfff8) <= 1) {
 int player = self->player;
 int index = self->index;
 int off, pos;
 if (!self->active) return 0;
 if (self->disabled) return 0;
 if (player == self->side) return 0;
 off = (player & 1) * 0x868;
 pos = index * 0x14;
 if (!((struct Entry *)((data_ov002_022cf16c + off + 0x30) + pos))->id) return 0;
 if (!*(u16 *)(data_ov002_022cf1a2 + off + pos)) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + off + pos)) return 0;
 if (func_ov002_021c1ef0((Card *)self, player, index)) return 2;
 return 0;
 }
 return 0;
}


