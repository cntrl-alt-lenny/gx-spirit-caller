typedef unsigned short u16;
struct Card { u16 id; u16 side:1; u16 slot:5; u16 rest:6; u16 state:2; u16 top:2; u16 pad:2; u16 blocked:1; u16 pad2:3; u16 number:9; u16 end:1; };
struct Packed { unsigned low:13; unsigned flag:1; unsigned middle:8; unsigned index:8; unsigned high:2; };
struct Row { struct Packed p; char tail[16]; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf1a8[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern int func_ov002_021b3fd8(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021bd030(int self);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern int func_ov002_021d8414(int arg0,int arg1,int arg2,int arg3,int arg4,int arg5,int arg6);
extern int func_ov002_021d90c0(int flag,int arg1,int arg2);
extern void func_ov002_021df6d4(int arg0,int arg1);
extern int func_ov002_021df818(struct Card *card,int side,int amount);
extern int func_ov002_021e1b24(int side,int id,int dest);
extern int func_ov002_021e27c0(int self_thing,int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_0221f2b0(struct Card *self) {
 int side=self->side, slot=self->slot;
 int dest=func_ov002_021bd030(side);
 int kind=*(int *)(data_ov002_022cf1a8+(side&1)*0x868+slot*20);
 int id, value;
 struct Packed *p;
 if(self->blocked) return 0;
 if(self->number != ((struct Row *)(data_ov002_022cf16c+(self->side&1)*0x868+0x30))[self->slot].p.index*2+((struct Row *)(data_ov002_022cf16c+(self->side&1)*0x868+0x30))[self->slot].p.flag) return 0;
 if(self->state==0) {
  func_ov002_021d479c((u16)((self->side?0x8000:0)|0x5f),0,self->slot,0);
  return 0;
 }
 switch(kind) {
 case 0:id=0x1497;break;
 case 1:id=0x1498;break;
 case 2:id=0x1499;break;
 case 3:id=0x149a;break;
 default:return 0;
 }
 switch(data_ov002_022ce288.mode) {
 case 0x80:
  if(func_ov002_0225368c(self->side,self->id,id)==0) {
   func_ov002_021ae400(self->side,0xd);return 0x78;
  } else { func_ov002_021ae400(side,0xf6);return 0x7f; }
 case 0x7f:func_ov002_021af9d0(self->side,6,self->id,id);return 0x7e;
 case 0x7e:
  switch(func_ov002_021afba0()) {case 0xb:return 0x7d;case 0xd:return 0x7c;default:return 0;}
 case 0x7d:
  p=(struct Packed *)func_ov002_021afb74();
  value=((struct Packed *)func_ov002_021afb74())->index*2+p->flag;
  func_ov002_021d90c0(side,slot,kind+1);
  func_ov002_021d8414(side,0xb,value,side,dest,1,0);
  func_ov002_021d479c((u16)((side?0x8000:0)|0x5f),(u16)(kind+1),(u16)dest,0);
  if(func_ov002_021b3fd8(side,0xb,0x1379,value)) {
   func_ov002_021df6d4(side,0x1379);
   func_ov002_021df818(self,side,0x7d0);
  }
  if(kind!=3) func_ov002_021e286c(side);
  return 0;
 case 0x7c:
  func_ov002_021d90c0(side,slot,kind+1);
  func_ov002_021e1b24(side,(u16)id,dest);
  func_ov002_021d479c((u16)((side?0x8000:0)|0x5f),(u16)(kind+1),(u16)dest,0);
  if(kind!=3)func_ov002_021e286c(side);
  return 0;
 case 0x78:func_ov002_021e27c0(side,1);return 0x77;
 case 0x77:func_ov002_0226b054(1-side);return 0x76;
 case 0x76:func_ov002_021e27c0(side,0);return 0x64;
 case 0x64:func_ov002_021e286c(side);return 0;
 }
 return 0;
}

