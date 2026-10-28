typedef unsigned int u32;
typedef struct { int x, y, z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char flag : 1; unsigned char flags : 7; } State;
typedef struct { u32 a,b,c; } Entry;
typedef struct Obj0202ab64 Obj0202ab64;
typedef struct Obj0202aba0 Obj0202aba0;
typedef struct { char pad[0xdc]; short mode; unsigned short x,y; } Acec;
typedef struct {
 u32 *pc; int count; char pad[0x60];
 Vec v0,v1,v2,v3;
 State s0,s1,s2,s3;
 int mode;
 short dc,de,e0,e2,e4,e6,e8;
 unsigned short active : 1; unsigned short rest : 15;
} Obj;
extern int func_02021cd8(Obj *o);
extern int func_020224c0(char *base, int mode, int val);
extern int func_02022644(Entry **script, State *state, Vec *out);
extern int func_0202290c(char *base, State *state, Vec *out);
extern int func_0202ab64(Obj0202ab64 *self);
extern int func_0202aba0(Obj0202aba0 *self);
extern int func_0202acec(Acec *o);
int func_0202a320(Obj *o) {
 u32 *start = o->pc;
 int done = 0;
 while (!done && !func_02021cd8(o)) {
  switch (*o->pc >> 24) {
  case 0xa0:
   o->mode=1;
   if (func_02022644((Entry **)&o->pc,&o->s0,&o->v0)) done=1;
   break;
  case 0xa1:
   o->dc=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)*o->pc);
   func_0202ab64((Obj0202ab64 *)o); o->pc++; break;
  case 0xa2:
   func_0202aba0((Obj0202aba0 *)o); o->pc++; break;
  case 0xa3: {
   Vec *v1=&o->v1; Vec *v2=&o->v2;
   v1->x=(short)func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)o->pc[1]) << 4;
   v1->y=(short)func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)(o->pc[1] >> 16)) << 4;
   o->s1.v=*v1;
   v2->x=(short)func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)o->pc[2]) << 4;
   v2->y=(short)func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)(o->pc[2] >> 16)) << 4;
   o->s2.v=*v2;
   o->pc+=3; break; }
  case 0xa4:
   if (func_02022644((Entry **)&o->pc,&o->s1,&o->v1)) done=1;
   break;
  case 0xa5:
   if (func_02022644((Entry **)&o->pc,&o->s2,&o->v2)) done=1;
   break;
  case 0xa6:
   o->de=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)*o->pc);
   func_0202acec((Acec *)o); o->pc++; break;
  case 0xa7:
   o->e0=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)*o->pc);
   func_0202acec((Acec *)o); o->pc++; break;
  case 0xa8:
   o->mode=3;
   if (func_02022644((Entry **)&o->pc,&o->s3,&o->v3)) done=1;
   break;
  case 0xa9: {
   int a,b,c;
   a=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)*o->pc);
   b=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)o->pc[1]);
   c=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)(o->pc[1] >> 16));
   o->e2=a; o->e4=b; o->e6=c; o->pc+=2; break;
  }
  case 0xaa:
   o->e8=func_020224c0((char *)o,(*o->pc >> 16)&255,(unsigned short)*o->pc);
   o->pc++; break;
  }
  if (o->pc!=start) o->count=0;
 }
 if (o->active) {
  if(o->s0.flag) func_0202290c((char *)o,&o->s0,&o->v0);
  if(o->s1.flag) func_0202290c((char *)o,&o->s1,&o->v1);
  if(o->s2.flag) func_0202290c((char *)o,&o->s2,&o->v2);
  if(o->s3.flag) func_0202290c((char *)o,&o->s3,&o->v3);
 }
 o->count++;
 return 1;
}

