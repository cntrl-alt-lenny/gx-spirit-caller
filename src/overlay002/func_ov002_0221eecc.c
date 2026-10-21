typedef unsigned short u16;
struct Card { u16 id; u16 side:1; u16 rest:15; u16 pad:2; u16 blocked:1; u16 rest4:13; u16 pad6; u16 saved; u16 current; };
struct State { char pad[0x5a8]; int mode; };
struct Packed { unsigned int low:13; unsigned int flag:1; unsigned int middle:8; unsigned int index:8; unsigned int high:2; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
int func_ov002_0221eecc(struct Card *self) {
 struct Packed *p;
 if (self->blocked) return 0;
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  if (*(int *)(data_ov002_022cf16c+0xc)==0 || *(int *)(data_ov002_022cf16c+0x874)==0) return 0;
  func_ov002_0226af94(self->side,self->id,1);
  return 0x7f;
 case 0x7f:
  p=(struct Packed *)(data_ov002_022cf16c+((1-self->side)&1)*0x868+0x120);
  p+=*(u16 *)(data_ov002_022d0e6c+0xb0);
  self->saved=p->index*2+p->flag;
  func_ov002_0226af94(1-self->side,self->id,1);
  return 0x7e;
 case 0x7e:
  p=(struct Packed *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
  p+=*(u16 *)(data_ov002_022d0e6c+0xb0);
  self->current=p->index*2+p->flag;
  func_ov002_021d479c(0x3f,(u16)(((1-self->side)&1)|0x16|((self->saved&0x3ff)<<6)),(u16)((self->side&1)|0x16|((*(int *)(data_ov002_022cf178+(self->side&1)*0x868)&0x3ff)<<6)),0);
  return 0x7d;
 case 0x7d:
  func_ov002_021d479c(0x3f,(u16)((self->side&1)|0x16|((self->current&0x3ff)<<6)),(u16)(((1-self->side)&1)|0x16|((*(int *)(data_ov002_022cf178+((1-self->side)&1)*0x868)&0x3ff)<<6)),0);
  return 0;
 }
 return 0;
}

