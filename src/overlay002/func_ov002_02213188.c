typedef unsigned short u16;
struct Input { u16 card; u16 player:1; u16 row:5; u16 rest:10; u16 pad:6; u16 number:9; u16 rest4:1; };
struct Row { unsigned id:13; unsigned low:1; unsigned pad:8; unsigned high:8; unsigned rest:2; char tail[16]; };
struct Table { char pad[0x30]; struct Row rows[1]; };
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[];
extern struct { char pad[0xcec]; int player, count; } data_ov002_022d016c;
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
int func_ov002_02213188(struct Input *self) {
 int player=self->player;
 int row=self->row;
 int sideOffset=(player&1)*0x868;
 int rowOffset=row*20;
 struct Row *slot=&((struct Table *)(data_ov002_022cf16c+sideOffset))->rows[row];
 if (self->number != slot->high*2+slot->low) return 0;
 if (*(u16 *)(data_ov002_022cf1a4+sideOffset+rowOffset)!=0) {
  func_ov002_021d90c0(player,row,data_ov002_022d016c.count+1+(data_ov002_022d016c.player==player));
 }
 return 0;
}
