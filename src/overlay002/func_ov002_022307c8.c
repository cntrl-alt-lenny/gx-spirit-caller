typedef unsigned short u16;
typedef unsigned int u32;
struct Ov002Self { u16 a; u16 b0:1; u16 pad:15; };
struct State { char pad[0x5a8]; int state; int choice; };
struct Globals { char pad[0xcf8]; int flag; char pad2[0x48]; int choice; };
extern struct State data_ov002_022ce288;
extern struct Globals data_ov002_022d016c;
extern char data_ov002_022cf178[], data_ov002_022cf17c[];
extern int data_ov002_022cd744[];
extern int func_ov002_021e96a0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021eb8c8(struct Ov002Self *self, int player, int idx);
/* Original calls pass only two arguments to these four-argument thunks. */
extern int func_ov002_02257878();
extern int func_ov002_021e104c();
extern u32 func_ov002_02257750(void *ctx, int (*cb)(void *, int, int));
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_0226af38(int arg0, int arg1, int arg2);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
extern int func_ov002_021f4260(int id, int index);
extern void func_ov002_021ae514(int id, int a, int b, int c, int d, int mask);
int func_ov002_022307c8(struct Ov002Self *self) {
 int mask, side, i;
 int a,b,c,d;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  mask=0;
  if (func_ov002_02257878((int)self, (int)func_ov002_021e96a0)) mask |= 1;
  if (func_ov002_02257878((int)self, (int)func_ov002_021eb8c8)) mask |= 2;
  side=self->b0;
  if (*(int *)(data_ov002_022cf178 + ((1-side)&1)*0x868)) mask |= 4;
  if (*(u32 *)(data_ov002_022cf17c + (side&1)*0x868) >= 2) {
   if (data_ov002_022d016c.flag == 0 || func_ov002_021bae7c(1-side,0x178b,-1)==0) mask |= 8;
  }
  if (!mask) return 0;
  if (data_ov002_022cd744[self->b0] == 1) {
   for(i=0;i<4;i++) if (mask & (1<<i)) break;
   data_ov002_022d016c.choice=i;
  } else {
   a=func_ov002_021f4260(self->a,0);
   b=func_ov002_021f4260(self->a,1);
   c=func_ov002_021f4260(self->a,2);
   d=func_ov002_021f4260(self->a,3);
   func_ov002_021ae514(0x103,a,b,c,d,mask);
  }
  return 0x7f;
 case 0x7f:
  data_ov002_022ce288.choice=data_ov002_022d016c.choice;
  func_ov002_0226b0d0(1-self->b0,self->a,data_ov002_022d016c.choice);
  return 0x7e;
 case 0x7e:
  switch(data_ov002_022ce288.choice) {
  case 0: func_ov002_021de408((int)self,func_ov002_02257750(self,(int (*)(void *,int,int))func_ov002_021e96a0)); break;
  case 1: func_ov002_021de408((int)self,func_ov002_02257750(self,(int (*)(void *,int,int))func_ov002_021eb8c8)); break;
  case 2: func_ov002_0226af38(1-self->b0,1,2); break;
  case 3: func_ov002_021e104c(self->b0,2); break;
  }
  return 0;
 }
 return 0;
}
