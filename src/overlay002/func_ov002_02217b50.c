typedef unsigned short u16;
struct F02201a40_F2 { u16 bit0:1; u16 pad:5; u16 tag6:6; u16 rest:4; };
struct F02201a40_Self { u16 f0; struct F02201a40_F2 f2; u16 low:2; u16 blocked:1; u16 high:13; };
struct Card { unsigned id:13; unsigned rest:19; };
struct Player { char pad[0x260]; struct Card cards[5]; char tail[0x5f4]; };
struct State { char pad[0x5a8]; int mode; };
struct Data { char pad[0xb0]; u16 a,b; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Data data_ov002_022d0e6c;
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021ae430(int a,const char *src);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int func_ov002_021b9b64(int unused0);
/* Original supplies only two of the thunk definition parameters. */
extern int func_ov002_021d8288();
/* Original omits the unused fourth thunk parameter. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e1bf8(int arg0);
extern int func_ov002_021e286c(int arg0);
/* This caller forwards r1 as well as self; the C callee uses only self. */
extern int func_ov002_02201a40(struct F02201a40_Self *self,int arg1);
extern void func_ov002_0226b1b4(int arg0,int arg1,const u16 *arg2,int arg3);
int func_ov002_02217b50(struct F02201a40_Self *self,int arg1) {
 u16 cards[5];
 int i;
 if(self->blocked) return 0;
 switch(data_ov002_022ce288.mode) {
 case 0x80:
  if(!func_ov002_02201a40(self,arg1)) return 0;
  func_ov002_021ae400(self->f2.bit0,0x2b); return 0x7f;
 case 0x7f:
  func_ov002_021af9d0(self->f2.bit0,0xb,self->f0,0); return 0x7e;
 case 0x7e:
  func_ov002_021e1bf8(self->f2.bit0); return 0x7d;
 case 0x7d:
  for(i=0;i<5;i++) cards[i]=data_ov002_022cf16c[self->f2.bit0 & 1].cards[i].id;
  func_ov002_0226b1b4(1-self->f2.bit0,self->f0,cards,5); return 0x7c;
 case 0x7c:
  func_ov002_021ae430(self->f2.bit0,(const char *)func_0202b100(data_ov002_022d0e6c.a)); return 0x7b;
 case 0x7b:
  func_ov002_021d8288(self->f2.bit0,func_ov002_021b9b64(data_ov002_022d0e6c.b)); return 0x7a;
 case 0x7a:
  func_ov002_021e13f4(self->f2.bit0,4,0); return 0x64;
 case 0x64:
  func_ov002_021e286c(self->f2.bit0); return 0x63;
 }
 return 0;
}

