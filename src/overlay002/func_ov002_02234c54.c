typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct Card { unsigned id:13; unsigned side:1; unsigned rest:18; };
struct Player { char pad[0x120]; struct Card cards[466]; };
struct Count { int count; char pad[0x864]; };
extern struct { char pad[0x5a8]; int state, count, other; } data_ov002_022ce288;
extern struct { char pad[0xd78]; int index; } data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d71e0(int player, int index, unsigned int flag);
/* This caller supplies only the first two arguments of the thunk. */
extern int func_ov002_021e104c();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_022107b4(int a, int b, int c);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(int player, int id, int (*callback)(int,int,int));
int func_ov002_02234c54(struct Self *self) {
 int player = self->side;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  data_ov002_022ce288.count = 0;
  data_ov002_022ce288.other = 0;
  player = self->side;
  if (!data_ov002_022cf178[player & 1].count) return 0;
  func_ov002_021ae400(player,0x1f);
  return 0x7f;
 case 0x7f:
  if (!data_ov002_022cf178[player & 1].count) return 0x7d;
  if (data_ov002_022cd744[player] == 1)
   func_ov002_02290500(player,self->id,func_ov002_022107b4);
  else func_ov002_022592ec((int)func_ov002_022107b4);
  return 0x7e;
 case 0x7e:
  if (func_ov002_022593f4()) {
   int index = data_ov002_022d016c.index;
   if (player != data_ov002_022cf16c[self->side & 1].cards[index].side)
    data_ov002_022ce288.other = 1;
   data_ov002_022ce288.count++;
   func_ov002_021d71e0(self->side,index,1);
   return 0x7f;
  }
  return data_ov002_022ce288.count ? 0x7d : 0x80;
 case 0x7d:
  func_ov002_021e286c(player);
  if (data_ov002_022ce288.other) func_ov002_021e286c(1-player);
  return 0x7c;
 case 0x7c:
  func_ov002_021e104c(player,data_ov002_022ce288.count);
  return 0;
 }
 return 0;
}

