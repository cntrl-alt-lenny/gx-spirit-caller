typedef unsigned short u16;
struct Obj { u16 id; u16 side:1; u16 pad:13; u16 flip:1; u16 tail:1; };
struct Card { unsigned id:13; unsigned low:1; unsigned pad:8; unsigned high:8; unsigned rest:2; };
struct Player { char pad[12]; unsigned count; char gap[272]; struct Card cards[466]; };
struct Count { unsigned count; char rest[2148]; };
struct State { char pad[1448]; int state; int index; };
struct Result { char pad[3448]; int index; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_02290500(int player, int id, int (*callback)(int,int,int));
extern int func_ov002_022107b4(int a,int b,int c);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e278c(int arg0,int arg1);
extern void func_ov002_021d71e0(int player,int index,unsigned int flag);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2d20(int arg0,int arg1,int arg2);
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021e104c();
int func_ov002_02230324(struct Obj *self) {
 int player = self->side ^ self->flip;
 unsigned i;
 switch(data_ov002_022ce288.state) {
 case 0x80:
  i=0;
  if(i<data_ov002_022cf178[player & 1].count) do {
   if(func_ov002_0225368c(player,self->id,i)) return 0x7f;
   i++;
  } while(i<data_ov002_022cf16c[player&1].count);
  return 0;
 case 0x7f:
  if(data_ov002_022cd744[player]==1) {
   func_ov002_02290500(player,self->id,func_ov002_022107b4);
  } else {
   func_ov002_021ae400(player,0x1f);
   func_ov002_022592ec((int)func_ov002_022107b4);
  }
  return 0x7e;
 case 0x7e:
  if(!func_ov002_022593f4()) return 0x7f;
  data_ov002_022ce288.index=data_ov002_022d016c.index;
  return 0x7d;
 case 0x7d:
  {
   int index=data_ov002_022ce288.index;
   struct Card *card=&data_ov002_022cf16c[player&1].cards[index];
   int id=card->high*2+card->low;
   func_ov002_021e278c(player,id);
   func_ov002_021d71e0(player,index,1);
   func_ov002_021e286c(id&1);
  }
  return 0x7c;
 case 0x7c:
  func_ov002_021e2d20(player,2,0);
  func_ov002_021e104c(player,1);
  return 0;
 }
 return 0;
}


