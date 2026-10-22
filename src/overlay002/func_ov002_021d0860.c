typedef unsigned int u32;
typedef unsigned short u16;
struct Rec { u32 id:13; u32 side:1; u32 b14:4; u32 b18:1; u32 b19:1; u32 b20:1; u32 b21:1; u32 pos:8; u32 rest:2; };
struct Slot { u16 player:1; u16 kind:5; u16 index:8; u16 flag14:1; u16 flag15:1; };
struct State { u16 f0,f2,f4,f6; char pad[0x804]; int active,phase,count; struct Rec rec; };
extern struct State data_ov002_022ce950;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cf17c[];
extern struct Rec data_ov002_022cf168;
extern int data_ov002_022cd73c[];
extern int func_0202e234(int x);
extern int func_ov002_021b0c04(int self,int arg1);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern void func_ov002_021bab38(int arg0,int kind,int v,struct Rec *p);
extern void func_ov002_021c2934(int player,int arg1,int arg2);
extern void func_ov002_021c29bc(int player,int arg);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern void func_ov002_0229ade0(int cmd,int a,int b,int c);
extern int func_ov002_0229c7f8(int cmd);
void func_ov002_021d0860(void) {
 int f4;
 u16 f6;
 int pos,flag,offset,player,id;
 u16 f2;
 struct Rec *p;
 struct Slot a,b;
 player=(data_ov002_022ce950.f0 & 0x8000)?1:0;
 flag=0;
 offset=(player&1)*0x868;
 f4=data_ov002_022ce950.f4;
 id=((struct Rec *)(data_ov002_022cf16c+offset+0x260))->id;
 pos=((struct Rec *)(data_ov002_022cf16c+offset+0x260))->pos*2+((struct Rec *)(data_ov002_022cf16c+offset+0x260))->side;
 f2=data_ov002_022ce950.f2;
 f6=data_ov002_022ce950.f6;
 if(f4&1) flag=1;
 if(f4&2) {if(func_0202e234(id)) flag=1;}
 if(f4&4) {if((pos&1)==0) flag=1;}
 if(f4&8) {if((pos&1)==1) flag=1;}
 switch(data_ov002_022ce950.phase) {
 case 0:
  data_ov002_022ce950.count=f2;
  if(f2==0) data_ov002_022ce950.active=0;
  else data_ov002_022ce950.phase++;
  break;
 case 1:
  if(*(int *)((char *)data_ov002_022cf17c+offset)==0) {data_ov002_022ce950.active=0;return;}
  if(flag) {
   p=(struct Rec *)(data_ov002_022cf16c+(player&1)*0x868+0x260);
   func_ov002_0229ade0(0x1f,player,0xd,p->pos*2+p->side);
  }
  data_ov002_022ce950.phase++;
  break;
 case 2:
  if(func_ov002_0229c7f8(0x1f)) return;
  p=func_ov002_021c93f0(player,0xd,0);
  p->b20=0;
  p->b18=f6;
  if(!flag) {
   func_ov002_021c2934(0,0x1361,1<<(p->side*8));
   func_ov002_021c2934(1,0x1361,1<<(p->side*8));
   if(func_0202e234(p->id)) func_ov002_021c29bc(1-p->side,0x1574);
  }
  if(flag) {
   func_ov002_021c2934(0,0x16da,1);
   func_ov002_021c2934(1,0x16da,1);
  }
  func_ov002_021b91c4((int *)&data_ov002_022cf168,(int *)p);
  if(player==(data_ov002_022cd73c[1]^1) && f6) {
   func_ov002_021b0c04(0x29,1);
   if(flag) {
    func_ov002_021b0c04(0x26,1);
    if(func_0202e234(data_ov002_022ce950.rec.id)) func_ov002_021b0c04(0x27,1);
   }
  }
  a.player=player;
  a.kind=0xd;
  a.index=0;
  a.flag15=0;
  a.flag14=1;
  b.player=data_ov002_022ce950.rec.side;
  b.kind=flag?0xf:0xe;
  b.index=1;
  b.flag15=0;
  b.flag14=1;
  func_ov002_021baa04(a.player,a.kind,a.index);
  func_ov002_021bab38(b.player,b.kind,flag?0:b.index,&data_ov002_022cf168);
  func_ov002_0229ade0(0x18,(u16)(data_ov002_022ce950.rec.pos*2+data_ov002_022ce950.rec.side),*(u16 *)&a,*(u16 *)&b);
  data_ov002_022ce950.phase++;
  break;
 case 3:
  if(--data_ov002_022ce950.count) data_ov002_022ce950.phase--;
  else data_ov002_022ce950.phase++;
  break;
 default: data_ov002_022ce950.active=0;break;
 }
}







