typedef unsigned short u16;
struct Ov002287Self { u16 f_0; u16 f2_b0:1; u16 :15; u16 f_4; };
struct Self { u16 id; u16 side:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2; };
struct State { char pad[0x5a8]; int state; int choice; };
struct Global { char pad[0xd44]; int choice; };
struct Pending { char pad[0xb0]; u16 active; u16 index; };
struct Player { int present; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern struct Pending data_ov002_022d0e6c;
extern struct Player data_ov002_022cf17c[];
extern int data_ov002_022cd744[];
extern int func_ov002_022287c4(struct Ov002287Self *self, int unused1);
extern int func_ov002_02281c90(unsigned int player);
extern int func_ov002_021ae514(int self,int a,int b,int c,int d,unsigned int flags);
extern int func_ov002_0226b0d0(int arg0,int arg1,int arg2);
extern int func_ov002_0226b194(int arg0,int arg1,int arg2);
extern void func_ov002_021e1870(int arg0,int idx,int arg2);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_021e286c(int arg0);
int func_ov002_02223b74(struct Self *self,int unused1) {
 if (self->category==2) return func_ov002_022287c4((struct Ov002287Self *)self,unused1);
 switch(data_ov002_022ce288.state) {
 case 0x80:
  if (!data_ov002_022cf17c[(1-self->side)&1].present) return 0;
  if (data_ov002_022cd744[self->side]==1) {
   data_ov002_022d016c.choice=func_ov002_02281c90(1-self->side);
  } else {
   func_ov002_021ae514(0x104,0x1b8,0x1b9,0x1ba,0,0xf);
  }
  return 0x7f;
 case 0x7f:
  data_ov002_022ce288.choice=data_ov002_022d016c.choice;
  func_ov002_0226b0d0(1-self->side,self->id,data_ov002_022d016c.choice);
  return 0x7e;
 case 0x7e:
  func_ov002_0226b194(1-self->side,self->id,data_ov002_022ce288.choice);
  return 0x7d;
 case 0x7d:
  if (data_ov002_022d0e6c.active) {
   func_ov002_021e1870(1-self->side,data_ov002_022d0e6c.index,1);
   return 0x7b;
  }
  func_ov002_021ae400(self->side,0xd);
  return 0x7c;
 case 0x7c:
  func_ov002_0226b054(self->side);
  return 0x7b;
 case 0x7b:
  func_ov002_021e286c(1-self->side);
  return 0;
 }
 return 0;
}
