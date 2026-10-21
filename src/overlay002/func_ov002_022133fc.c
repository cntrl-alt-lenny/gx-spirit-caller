typedef unsigned short u16;
typedef unsigned char u8;
struct Ov002Self {
 u16 card;
 u16 player:1; u16 row:5; u16 rest2:10;
 u16 pad4:2; u16 disabled:1; u16 flag:1; u16 pad5:2; u16 number:9; u16 rest4:1;
 char pad6[6]; u16 mode;
};
struct Node;
struct Row { unsigned id:13; unsigned low:1; unsigned pad:8; unsigned high:8; unsigned rest:2; char tail[16]; };
struct Table { char pad[0x30]; struct Row rows[1]; };
extern struct { char pad[0x5a8]; int state, index; } data_ov002_022ce288;
extern char data_ov002_022cf16c[], data_ov002_022cf1a2[], data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
/* The original omits the unused fourth argument. */
extern int func_ov002_021d5d48();
extern void func_ov002_021e2b3c(int unused0);
/* The original supplies no argument and the definition ignores its parameter. */
extern void func_ov002_021e2c5c();
int func_ov002_022133fc(struct Ov002Self *self) {
 int player, row;
 if (self->disabled) { self->flag=1; return 0; }
 switch (data_ov002_022ce288.state) {
 case 0x80: {
  int out;
  data_ov002_022ce288.index=0;
  func_ov002_021e2b3c(0);
  if (self->mode!=2) {
   if (func_ov002_0223df38((struct Node *)self,data_ov002_022ce288.index,&out)) {
    player=out&0xff;
    row=((int)(u16)out >> 8)&0xff;
    int sideOffset=(player&1)*0x868;
    int rowOffset=(short)row*20;
    if (((struct Table *)(data_ov002_022cf16c+sideOffset))->rows[(short)row].id &&
        *(u16 *)(data_ov002_022cf1a2+sideOffset+rowOffset)==0 && self->player!=player)
      func_ov002_021d6808(self,player,row,0,0);
   }
   data_ov002_022ce288.index++;
  }
  return 0x7f;
 }
 case 0x7f: {
  int out;
  if (self->mode!=1 && func_ov002_0223df38((struct Node *)self,data_ov002_022ce288.index,&out)) {
   int other, hi, idx;
   player=self->player;
   row=self->row;

   hi=(int)(u16)out>>8;
   other=out&0xff;
   idx=hi&0xff;
   player=self->player;
   row=self->row;
   struct Row *slot=&((struct Table *)(data_ov002_022cf16c+(player&1)*0x868))->rows[row];
   if (slot->high*2+slot->low==self->number) {
    int sideOffset=(other&1)*0x868;
    int rowOffset=idx*20;
    if (
       ((struct Table *)(data_ov002_022cf16c+sideOffset))->rows[idx].id &&
       *(u16 *)(data_ov002_022cf1a4+sideOffset+rowOffset)!=0 && player==other) {
    func_ov002_021d5d48(player,(u16)((u8)player|((u8)row<<8)),(u16)out);
    return 0x7e;
    }
   }
  }
  self->flag=1;
  return 0x7e;
 }
 case 0x7e: func_ov002_021e2c5c(); return 0;
 }
 return 0;
}






