typedef unsigned short u16;
typedef unsigned char u8;
struct Node; struct node;
struct Self { u16 id; u16 side:1; u16 slot:5; u16 rest2:10; u16 a:2; u16 blocked:1; u16 rest4:13; u16 f6; u16 f8; u16 f10; u16 f12; };
struct Entry { unsigned id:13; unsigned rest:19; char tail[16]; };
struct Player { char pad[0x30]; struct Entry cards[10]; char tail[1904]; };
struct State { char pad[0x5a8]; int state; };
struct Global { char pad[0xcec]; int side; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct Node *self,int idx,int *out);
extern u16 func_ov002_0223de94(struct node *self,int idx);
extern int func_ov002_021c2624(int side,int slot,int id);
extern int func_ov002_021b34f4(int row_sel,int col_idx,int lo_want,int hi_want);
extern int func_ov002_021b3ac0(int a,int b,int c,int d);
extern void func_ov002_021d5f2c(int arg0,int arg1);
extern int func_ov002_021de408(int a,int b);
/* Original calls omit the unused formal argument. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_022206d8(struct Self *self,struct Self *other) {
 int pair,lo,hi,i,side,j;
 if(self->blocked) return 0;
 if(func_ov002_0223df38((struct Node *)self,0,0)) {
  pair=func_ov002_0223de94((struct node *)self,0);
  lo=pair&0xff;
  hi=((int)(u16)pair>>8)&0xff;
  switch(data_ov002_022ce288.state) {
  case 0x80:
   self->f10=0; self->f12=0;
   func_ov002_021e2b3c();
   return 0x7f;
  case 0x7f:
   for(i=0;i<2;i++) {
    struct Entry *card; char *flagsPtr;
    side=data_ov002_022d016c.side^i;
    card=&data_ov002_022cf16c[side&1].cards[5];
    flagsPtr=(char *)&data_ov002_022cf16c[side&1]+0x64;
    for(j=5;j<10;j++,card++,flagsPtr+=20) {
     if(card->id && func_ov002_021c2624(side,j,card->id) && !func_ov002_021b34f4(lo,hi,side,j)) {
      if(func_ov002_021b3ac0(side,j,lo,hi)) {
       unsigned flags=*(unsigned *)(flagsPtr+0x40);
       if(((flags>>1)|(flags>>2))&1) {
        if(side==other->side && j==other->slot) other->f8=self->f8;
       } else {
        func_ov002_021d5f2c((u16)((u8)side|((u8)j<<8)),pair & 0xffff);
        return 0x7f;
       }
      } else (&self->f10)[side]|=1<<j;
     }
    }
   }
   return 0x7e;
  case 0x7e:
   func_ov002_021de408((int)self,self->f10|(self->f12<<16));
   func_ov002_021e2c5c();
   return 0;
  }
 }
 return 0;
}






