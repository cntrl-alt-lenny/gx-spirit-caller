typedef unsigned short u16;
typedef unsigned char u8;
struct Input { u16 card; u16 player:1; u16 row:5; u16 rest:10; u16 pad:6; u16 number:9; u16 rest4:1; };
struct Node;
struct Row { unsigned id:13; unsigned low:1; unsigned pad:8; unsigned high:8; unsigned rest:2; char tail[16]; };
struct Table { char pad[0x30]; struct Row rows[1]; };
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_021c1a2c(int player, int row, int card);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d7100(int flag, unsigned short arg1, unsigned short arg2);
int func_ov002_02213244(struct Input *self) {
 int player=self->player;
 int row=self->row;
 int sideOffset=(player&1)*0x868;
 int rowOffset=row*20;
 struct Row *slot=&((struct Table *)(data_ov002_022cf16c+sideOffset))->rows[row];
 int out;
 if (self->number != slot->high*2+slot->low) return 0;
 if (*(u16 *)(data_ov002_022cf1a4+sideOffset+rowOffset)==0) return 0;
 if (func_ov002_0223df38((struct Node *)self,0,&out)) {
  int player, row, other, idx, hi;
  player=self->player;
  row=self->row;
  hi=(int)(u16)out>>8;
  other=out&0xff;
  idx=hi&0xff;
  if (player!=other && func_ov002_021c1a2c(player,row,self->card) && func_ov002_021c1a2c(other,idx,self->card)) {
   func_ov002_021d5b80(player,row,self->card,1);
   func_ov002_021d5b80(other,idx,self->card,1);
   func_ov002_021d59cc(player,row,self->card,5,(u16)other);
   func_ov002_021d59cc(other,idx,self->card,5,(u16)player);
   func_ov002_021d7100(player,(u16)((u8)player|((u8)row<<8)),(u16)((u8)other|((u8)idx<<8)));
  }
 }
 return 0;
}


