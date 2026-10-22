typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
 u16 f0;
 u16 flag0:1; u16 field:5; u16 :10;
} Card021c1e44;
struct State { char pad[0x5a8]; int mode, first, second; };
struct Selection { char pad[0xb0]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Selection data_ov002_022d0e6c;
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_0226b034(int arg0, int arg1, int arg2);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c1a2c(int a, int b, int c);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d7100(int a, int b, int c);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0221dda4(Card021c1e44 *self, void *q) {
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  return func_ov002_02257b48(self,q) ? 0x7f : 0;
 case 0x7f:
  func_ov002_0226b034(self->flag0,self->f0,self->flag0);
  return 0x7e;
 case 0x7e:
  data_ov002_022ce288.first = (data_ov002_022d0e6c.value >> 8) & 0xff;
  func_ov002_0226b034(1-self->flag0,self->f0,self->flag0);
  return 0x7d;
 case 0x7d:
  data_ov002_022ce288.second = (data_ov002_022d0e6c.value >> 8) & 0xff;
  return 0x7c;
 case 0x7c:
  if (func_ov002_021c1e44(self,self->flag0,data_ov002_022ce288.first)) return 0;
  if (!func_ov002_021c1a2c(self->flag0,data_ov002_022ce288.first,self->f0)) return 0;
  if (func_ov002_021c1e44(self,1-self->flag0,data_ov002_022ce288.second)) return 0;
  if (!func_ov002_021c1a2c(1-self->flag0,data_ov002_022ce288.second,self->f0)) return 0;
  func_ov002_021d59cc(self->flag0,data_ov002_022ce288.first,self->f0,5,(u16)(1-self->flag0));
  func_ov002_021d59cc(1-self->flag0,data_ov002_022ce288.second,self->f0,5,self->flag0);
  func_ov002_021d7100(self->flag0,(u16)((u8)self->flag0 | ((u8)data_ov002_022ce288.first << 8)),(u16)((u8)(1-self->flag0) | ((u8)data_ov002_022ce288.second << 8)));
  return 0x7b;
 case 0x7b:
  func_ov002_021e2d94(self->flag0,data_ov002_022ce288.first,0x15,1);
  func_ov002_021e2d94(1-self->flag0,data_ov002_022ce288.second,0x15,1);
  return 0;
 default: return 0;
 }
}
