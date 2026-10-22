typedef unsigned short u16;
typedef unsigned char u8;
struct Ov002Self { u16 id; u16 player:1; u16 idx:5; u16 pad:6; u16 mode:2; u16 rest:2; u16 pad4:6; u16 value:9; u16 top:1; };
struct Node;
struct Row { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned hi:8; unsigned rest:2; };
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern int func_ov002_021b4254(int a,int b);
extern int func_ov002_021ba294(int player,int arg1);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021c8470(int a,int b);
extern int func_ov002_021d5a08(struct Ov002Self *arg0,int arg1,int arg2,int arg3,u16 arg4,u16 arg5);
extern int func_ov002_021d5a6c(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021d7d0c(struct Ov002Self *,int,int *);
/* Original supplies two arguments to the four-argument forwarding thunk. */
extern int func_ov002_021d8288();
extern int func_ov002_021de9d4(int a,int b,int c);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0223df38(struct Node *self,int idx,int *out);
extern int func_ov002_022536e8(int self,int arg1,int arg2);
extern int func_ov002_0225764c(int arg0,int arg1,int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_0221e6c0(struct Ov002Self *self) {
 int n, packed, player, idx, total;
 if (self->mode == 2) {
  switch(data_ov002_022ce288.state) {
  case 0x80:
   n=func_ov002_021ba294(self->player,self->id);
   if(n>=0) {
    if(func_ov002_021d8288(self->player,data_ov002_022cf16c+(self->player&1)*0x868+0x260+n*4)) return 0x64;
   }
   func_ov002_021ae400(self->player,0x15);
   return 0x6f;
  case 0x6f:
   func_ov002_0226b054(1-self->player);
   return 0x64;
  case 0x64:
   func_ov002_021e286c(self->player);
   return 0;
  }
 } else if(func_ov002_021b4254(self->value,self->id)<3) {
  switch(data_ov002_022ce288.state) {
  case 0x80:
   if(func_ov002_022536e8(self->player,self->id,0)==0) return 0;
   func_ov002_021ae400(self->player,0x5e);
   return 0x7f;
  case 0x7f:
   func_ov002_021af9d0(self->player,6,self->id,0);
   return 0x7e;
  case 0x7e:
   if(func_ov002_021afba0()==0xe) func_ov002_021d7d0c(self,self->player,func_ov002_021afb74());
   else func_ov002_021d8288(self->player,func_ov002_021afb74());
   return 0x7d;
  case 0x7d:
   {
    int v=self->value;
    int i=self->idx;
    int p=self->player;
    struct Row *row=(struct Row *)(data_ov002_022cf16c+(p&1)*0x868+0x30+i*20);
    if(v!=row->hi*2+row->side) return 0;
    func_ov002_021de9d4((int)self,p,i);
    func_ov002_021e286c(self->value&1);
    func_ov002_021d5a6c(self->value,self->id,5,0);
    return 0;
   }
  }
 } else if(func_ov002_0223df38((struct Node *)self,0,&packed)) {
  player=(u8)packed;
  idx=(u8)((u16)packed>>8);
  if(func_ov002_0225764c((int)self,player,idx)) {
   total=func_ov002_021c8470(player,idx);
   total=total*func_ov002_021bbf50(1-self->player)/10;
   if(total>0xffff) total=0xffff;
   func_ov002_021d5a08(self,player,idx,self->id,2,(u16)total);
  }
 }
 return 0;
}




