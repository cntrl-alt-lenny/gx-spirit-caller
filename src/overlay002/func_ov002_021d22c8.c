typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 player:1, kind:5, extra:8, a:1, b:1; } Packed;
typedef struct { u16 f0,f2; Packed f4; u16 f6; char pad[0x804]; int active,state; } State;
typedef struct { char pad[0x120]; int cards[0x1d2]; } Player;
typedef struct { u32 flags; char pad[0x864]; } Flags;
extern State data_ov002_022ce950;
extern Player data_ov002_022cf16c[];
extern int data_ov002_022cf168;
extern Flags data_ov002_022cf288[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern int func_ov002_021b0c04(int self,int arg1);
extern void func_ov002_021b1f20(int,int,int,int,int);
extern int func_ov002_021b3e28(int,int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern void func_ov002_021b9254(int,int,int *,int,int);
extern int func_ov002_021b9aa8(u32 a,u32 b);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern void func_ov002_021c9b80(int,int,int,int);
extern int func_ov002_0229ade0(int,int,int,int);
/* The original caller supplies only r0; the other three parameters are unused. */
extern int func_ov002_0229c7f8();
static inline int word(u16 hi,u16 lo) { return lo | (hi << 16); }
void func_ov002_021d22c8(void) {
 int player,card,id,kind,flag,index,side,bit;
 Packed input,p,q;
 player=(data_ov002_022ce950.f0 & 0x8000)?1:0;
 input=data_ov002_022ce950.f4;
 id=data_ov002_022ce950.f6 >> 1;
 bit=data_ov002_022ce950.f6 & 1;
 card=data_ov002_022ce950.f2;
 kind=input.kind;
 flag=input.a;
 side=input.b;
 index=func_ov002_021b9aa8(player,id);
 switch(data_ov002_022ce950.state) {
 case 0:
 func_ov002_0229ade0(0x44,player,card,flag);
 data_ov002_022ce950.state++;
 break;
 case 1:
 if(func_ov002_0229c7f8(0x44)) return;
 func_ov002_021b91c4(&data_ov002_022cf168,&data_ov002_022cf16c[player&1].cards[index]);
 p.player=(u16)player;
 p.kind=11;
 p.extra=(u16)index;
 p.b=0;
 p.a=(u16)flag;
 q.player=(u16)player;
 q.kind=(u16)kind;
 q.extra=0;
 q.b=(u16)side;
 q.a=(u16)flag;
 func_ov002_021baa04(p.player,p.kind,p.extra);
 func_ov002_021b9254(player,kind,&data_ov002_022cf168,side,flag);
 if(flag) func_ov002_021c9b80(player,kind,2,1);
 func_ov002_0229ade0(0x18,word((u16)(flag?1:4),(u16)id),*(u16 *)&p,*(u16 *)&q);
 data_ov002_022ce950.state++;
 break;
 case 2:
 if(func_ov002_021b3ecc(player,11,0x15c7)) {
 int value=func_ov002_021b3e28(player,11,0x15c7);
 func_ov002_021b1f20(player,kind,1,0x15c7,value);
 }
 if(bit) data_ov002_022cf288[player&1].flags |= 0x20000;
 if(*(int *)(data_ov002_022d016c+0xcf8)==2)
 data_ov002_022cf288[*(int *)(data_ov002_022d016c+0xcec)&1].flags |= 0x100000;
 if(!flag) {
 if(player==data_ov002_022cd73c[1]) {
 func_ov002_021b0c04(0x15,1);
 func_ov002_021b0c04(0x1c,1);
 }
 func_ov002_0229ade0(0x1c,player,kind,side);
 }
 data_ov002_022ce950.state++;
 break;
 case 3:
 if(func_ov002_0229c7f8(0x1c)==0) data_ov002_022ce950.active=0;
 break;
 }
}

