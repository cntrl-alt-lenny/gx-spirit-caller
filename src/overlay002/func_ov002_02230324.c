typedef unsigned short u16;
struct Node { u16 id; u16 owner:1; u16 pad:13; u16 side:1; u16 rest:1; };
struct Card { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; };
struct Player { char pad0[12]; unsigned count; char pad1[272]; struct Card cards[466]; };
struct Count { unsigned count; char pad[2148]; };
extern char data_ov002_022ce288[];
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int func_ov002_022107b4(int a,int b,int c);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern void func_ov002_02290500(int player,int id,int (*callback)(int,int,int));
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e278c(int arg0,int arg1);
extern void func_ov002_021d71e0(int player,int index,unsigned int flag);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2d20(int arg0,int arg1,int arg2);
/* This call supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021e104c();
int func_ov002_02230324(struct Node *self) {
 int player = self->owner ^ self->side;
 unsigned i;
 switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
 case 0x80:
  i=0;
  if (i<data_ov002_022cf178[player & 1].count) {
   do {
   if (func_ov002_0225368c(player,self->id,i)) return 0x7f;
    i++;
   } while (i<data_ov002_022cf16c[player & 1].count);
  }
  return 0;
 case 0x7f:
  if (data_ov002_022cd744[player]==1) {
   func_ov002_02290500(player,self->id,func_ov002_022107b4);
  } else {
   func_ov002_021ae400(player,0x1f);
   func_ov002_022592ec((int)func_ov002_022107b4);
  }
  return 0x7e;
 case 0x7e:
  if (!func_ov002_022593f4()) return 0x7f;
  *(int *)(data_ov002_022ce288+0x5ac)=*(int *)(data_ov002_022d016c+0xd78);
  return 0x7d;
 case 0x7d:
  {
   int index=*(int *)(data_ov002_022ce288+0x5ac);
   struct Card *card=&data_ov002_022cf16c[player & 1].cards[index];
   int value=card->value*2+card->flag;
   func_ov002_021e278c(player,value);
   func_ov002_021d71e0(player,index,1);
   func_ov002_021e286c(value & 1);
   return 0x7c;
  }
 case 0x7c:
  func_ov002_021e2d20(player,2,0);
  func_ov002_021e104c(player,1);
  return 0;
 }
 return 0;
}


