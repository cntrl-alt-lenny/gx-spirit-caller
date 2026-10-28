typedef struct { unsigned short kind, state; } Event;
typedef struct { char pad[0x2170]; unsigned short flags; char pad2[0xee]; int state; unsigned int bits; char pad3[3]; unsigned char field; char pad4[0x16]; unsigned short field2; char pad5[0x74]; unsigned short value; } State;
extern State *data_021a088c;
extern void func_0207a544(Event *self);
extern void func_0207ab68(Event *self);
extern void func_0207b038(int a0);
extern int func_0207b13c(int a, int b, int c, int d);
extern int func_0209ea24(void (*callback)(Event *), void *buffer, void *extra, int flag, unsigned short mode);
extern int func_0209f0d8(int a0);
#define G(off) (*(int *)((char *)data_021a088c + (off)))
#define H(off) (*(unsigned short *)((char *)data_021a088c + (off)))
#define B(off) (*(unsigned char *)((char *)data_021a088c + (off)))
int func_02079e78(Event *self) {
 int result;
 unsigned short value;
 if (self->state == 0) {
  data_021a088c->field=0;
  data_021a088c->field2=0;
  switch(data_021a088c->state) {
  case 5: case 6:
   func_0207b038(3); return func_0207b13c(1,0,0,0x8f5);
  case 7:
   func_0207b038(3); return func_0207b13c(0,0,0,0x8fb);
  case 8:
   value=data_021a088c->value; data_021a088c->value=0;
   if (value == 0x12 && (data_021a088c->flags&0x24)!=0x24) {
    unsigned short mode;
    int flag;
    data_021a088c->flags|=0x24;
    mode=(data_021a088c->bits&0xc0000)==0xc0000 ? 1 : 0;
    flag=(data_021a088c->bits&0x30000)==0x30000 ? 0 : 1;
    result=func_0209ea24(func_0207a544,(char *)data_021a088c+0x2140,0,flag,mode);
    switch (result) { case 2: return result; case 8:
     func_0207b038(12); return func_0207b13c(1,(int)((char *)data_021a088c+0x2140),value,0x91c); case 3: default: func_0207b038(11); return func_0207b13c(7,(int)((char *)data_021a088c+0x2140),value,0x925); }
   }
   func_0207b038(3); return func_0207b13c(1,(int)((char *)data_021a088c+0x2140),value,0x92d);
  case 9: case 12:
   func_0207b038(3); return func_0207b13c(0,(int)((char *)data_021a088c+0x2140),1,0x935);
  case 10:
   func_0207b038(3); return func_0207b13c(0,(int)((char *)data_021a088c+0x2140),0,0x93c);
  case 13:
   result=func_0209f0d8((int)func_0207ab68);
   switch(result) { case 2: return result; case 8: func_0207b038(12); return func_0207b13c(1,0,0,0x94a); case 3: default: func_0207b038(11); return func_0207b13c(7,0,0,0x953); }
  default:
   func_0207b038(11); return func_0207b13c(7,0,data_021a088c->state,0x959);
  }
 }
 func_0207b038(11); return func_0207b13c(7,0,0,0x960);
}



