typedef unsigned int u32;
typedef unsigned short u16;
struct State {
 u32 side:1; u32 slot:4; u32 flag:1; u32 kind:2; u32 id:15; u32 high:9;
 u16 unused; u16 code;
 unsigned char count, distinct; char pad[6];
 u16 list[4];
 u32 phase:8; u32 rest:24;
};
struct Phase { u32 phase:8; u32 rest:24; };
struct Global { char pad[0xd44]; int result; };
struct Command { u16 side:1; u16 slot:4; u16 spare:9; u16 flag:1; u16 kind:1; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern struct Global data_ov002_022d016c;
extern int func_02030608(int a);
extern void func_ov002_021ae638(int p, unsigned int b, unsigned int c);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);
extern int func_ov002_021deb84(int a, int b);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021e286c(int a);
extern int func_ov002_022768b4(int a);
extern int func_ov002_02278780(void);
extern int func_ov002_022862cc(int a,int b,int c,int d,int e,int f);
int func_ov002_022796ec(void) {
 struct State *s = &data_ov002_022cd300;
 switch (s->phase) {
 case 0:
  if(s->kind == 2) {
   if(data_ov002_022cd744[s->side] == 1)
    data_ov002_022d016c.result = func_ov002_022862cc(s->side,s->id,s->flag,s->count,(int)s->list,1);
   else func_ov002_021ae638(0xf7,s->high,s->flag);
  }
  data_ov002_022cd318.phase++;
  return 0;
 case 1: {
  int mask;
  int i;
  if(s->kind == 2) {
   s->kind = data_ov002_022d016c.result;
   if(s->kind == 0) s->flag = 1;
  }
  if(s->flag) func_ov002_021d479c((s->side ? 0x8000 : 0) | 0x60,s->id,s->kind,6);
  mask=0;
  s->distinct=0;
  for(i=0;i<s->count;i++) {
   func_ov002_021d479c((u16)(((s->list[i]&0xff) ? 0x8000 : 0) | 0x4a),(unsigned char)(s->list[i]>>8),0,0);
   if(i==0 || s->list[i] != s->list[i-1]) s->distinct++;
  }
  for(i=0;i<s->count;i++) {
   u16 v=s->list[i];
   mask |= 1 << (((v>>8)&0xff) + ((int)(unsigned char)v<<4));
  }
  func_ov002_021deb84(s->side,mask);
  data_ov002_022cd318.phase++;
  return 0;
 }
 case 2: {
  u16 amount;

  if(s->code==0x1578 || s->code==0x1a92) {
   func_ov002_021e276c(s->side,(u16)s->id,1,0);
   s->side ^= 1;
  }
  amount=0;
  switch(s->id) {
  case 0x18b4: {
   int v=data_ov002_022cd300.list[0]*700;
   if(v>0xffff) v=0xffff;
   amount=(u16)v;
   break;
  }
  }
  {
   int side=s->side;
   int slot=s->slot;
   int flag=s->flag;
   int kind=s->kind;
   func_ov002_021d479c(0x2d,(u16)((side&1)|((slot&31)<<1)|0x40|((flag&1)<<14)|((kind&1)<<15)),(u16)s->high,amount);
  }  if(func_02030608(s->id)) data_ov002_022cd300.phase=3;
  else data_ov002_022cd300.phase=8;
  return 0;
 }
 case 3: case 4: case 5: case 6: case 7:
  return func_ov002_022768b4(0x21);
 default:
  if(func_ov002_02278780()) {
   switch(s->id) {
   case 0x112e: case 0x128c: case 0x196b: case 0x196c: case 0x196d: case 0x196e:
    func_ov002_021e286c(s->side);
   }
   return 1;
  }
  return 0;
 }
}





