typedef unsigned short u16;
struct node { u16 kind; u16 owner:1; u16 rest:15; u16 pad4; u16 pad6; u16 arr8[5]; u16 f18; int f20; };
struct Self;
struct Global { char pad[0x5b8]; int state; };
struct Player { int value; char pad[0x864]; };
struct Global2 { char pad[0xb0]; u16 value; };
extern struct Global data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Global2 data_ov002_022d0e6c;
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern void func_ov002_021c4c9c(int side, int slot, int *out);
extern int func_ov002_0226b298(int arg0, int arg1, int arg2);
extern void func_ov002_021df780(int arg0, int arg1);
int func_ov002_02242900(struct node *self) {
 int side, slot;
 int info[11];
 int pair, value, player, limit, amount;
 switch (data_ov002_022ce288.state) {
 case 0:
  for (side=0; side<2; side++) {
   for (slot=0; slot<=4; slot++) {
    if (func_ov002_022575c8((int)self,side,slot)) {
     func_ov002_0223dcc0((struct Self *)self,side,slot);
     data_ov002_022ce288.state=10;
     return 0;
    }
   }
  }
  return 0;
 case 10:
  pair=func_ov002_0223de94(self,0);
  pair=(u16)pair;
  func_ov002_021c4c9c((unsigned char)pair,(unsigned char)(pair>>8),info);
  value=info[5]>info[6]?info[5]:info[6];
  player=self->owner;
  limit=data_ov002_022cf16c[player & 1].value-1;
  if (value>=limit) value=limit;
  if (value>=0xffff) value=0xffff;
  amount=value/100;
  if (amount>=255) amount=255;
  if (amount==0) {
   self->arr8[2]=0;
   return 1;
  }
  func_ov002_0226b298(player,self->kind,amount);
  data_ov002_022ce288.state++;
  return 0;
 case 11:
  value=data_ov002_022d0e6c.value*100;
  func_ov002_021df780(self->owner,value);
  self->arr8[2]=value;
  return 1;
 }
 return 0;
}





