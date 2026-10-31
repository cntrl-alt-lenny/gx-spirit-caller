typedef unsigned short u16;
struct Self { u16 pad[2]; u16 unused:6; u16 value:9; u16 rest:1; };
struct Card { unsigned id:13; unsigned bit:1; unsigned pad:8; unsigned value:8; unsigned rest:2; };
struct Entry { struct Card card; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b8fcc(int a0, int a1);
int func_ov002_021edfa8(struct Self *self, int player, int index) {
 int idx, side;
 if (index == 10) return 0;
 if (index < 5) {
  if (func_ov002_021b8fcc(player,index) == 0) return 0;
 }
 idx = index*20;
 side = (player & 1)*0x868;
 if (((struct Player *)data_ov002_022cf16c)[player & 1].cards[index].card.id == 0) return 0;
 if (*(u16 *)(data_ov002_022cf1a4+side+idx) != 0) return 0;
 if ((*(unsigned *)(data_ov002_022cf1ac+side+idx) >> 9)&1) return 0;
 return self->value != (((struct Card *)(data_ov002_022cf16c+side+0x30+idx))->value*2 + ((struct Card *)(data_ov002_022cf16c+side+0x30+idx))->bit);
}


