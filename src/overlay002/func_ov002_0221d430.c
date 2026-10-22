typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1, pad:11, mode:2, rest:2; char gap[16]; unsigned int value; };
struct Row { unsigned id:13, flag:1, pad:8, level:8, rest:2; char tail[16]; };
struct Entry { u16 id:13, rest:3; u16 other; };
struct Node;
struct node;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf8f4[];
extern int data_ov002_022cf1ac[];
extern struct Entry data_ov002_022d0250[];
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021de678(void *self, int side, int slot, int mask);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c10e8(int side, int slot, int mode);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern unsigned int func_ov002_021b947c(int idx);
extern void func_ov002_021d8474(int a0,int a1,int a2,int a3,int a4,int a5,int a6);
extern int func_0202e234(int x);
extern int func_ov002_021de480(int arg0,int arg1,int arg2,int arg3);
extern void func_ov002_021e2d94(int arg0,int arg1,int arg2,int arg3);
int func_ov002_0221d430(struct Self *self) {
 int lo, hi;
 unsigned int raw;
 int number, side;
 if (self->mode == 0) {
  if (func_ov002_0223df38((struct Node *)self,0,0)) {
   raw=func_ov002_0223de94((struct node *)self,0);
   lo=(u8)raw;
   hi=(u8)((u16)raw >> 8);
   if (func_ov002_0225764c((int)self,lo,hi)) {
    struct Row *rows=(struct Row *)(data_ov002_022cf16c+(lo&1)*0x868+0x30);
    int level=rows[hi].level*2+rows[hi].flag;
    if (!func_ov002_021de678(self,lo,hi,0x40)) return 0;
    if (!func_0202e2f8(rows[hi].id)) {
     func_ov002_021e276c(self->side,self->id,0x21,(u16)(func_ov002_021c10e8(lo,hi,1)*4+level*8));
    }
   }
  }
  return 0;
 }
 number=self->value>>3;
 side=(self->value>>2)&1;
 raw=func_ov002_021b947c(number);
 lo=(u8)raw;
 hi=(u8)((u16)raw>>8);
 {
  u16 index=raw>>16;
  switch(data_ov002_022ce288.state) {
  case 0x80:
   if (hi==15) {
    u16 value=*(u16 *)(data_ov002_022cf8f4+(lo&1)*0x868+index*2);
    if ((u8)value==0x40) {
     u8 flags=value>>8;
     u8 high=(flags&0xf0)>>4;
     u8 low=flags&15;
     side=(flags>>1)&1;
     { int bit=(flags>>2)&1;
      func_ov002_021d8474(lo,15,number,low&1,high,side,bit);
     }
     return 0x7f;
    }
   }
   return 0;
  case 0x7f:
   if (!func_0202e234(data_ov002_022d0250[number].id)) {
    func_ov002_021de480(lo,hi,0,0);
    return 0;
   }
   if(lo!=side) {
    func_ov002_021e2d94(lo,hi,0, !(*(unsigned int *)((char *)data_ov002_022cf1ac+(lo&1)*0x868+hi*20)&1));
   }
   func_ov002_021e2d94(lo,hi,0x15,0);
   return 0;
  }
 }
 return 0;
}
