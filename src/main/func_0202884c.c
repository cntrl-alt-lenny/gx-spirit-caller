typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int x,y,z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char flag:1,rest:7; } State;
typedef struct { u32 a,b,c; } Entry;
typedef struct { void *name; unsigned char mode; char pad[3]; int x,y; int pos[3]; u32 flags; } Arg;
typedef struct { int f0,f4,f8,fc; unsigned char kind; char pad[3]; int x,y; int pos[3]; u32 flags; } Input;
typedef struct Obj {
 u32 *script; int timer; char pad8[0x60]; void *name; int f6c;
 int x,y,z,xx,yy,zz; Arg *arg; short h8c; char pad8e[2]; int f90; Input *input;
 char pad98[0xd4]; Vec pos; State state; void *p188; short screen,h18e,h190; char pad192[8];
 u16 b0:1,b1:1,b2:1,b3:1,b4:1,b5:1,b6:1,rest:9;
} Obj;
typedef struct { int type,id,mode; } Query;
extern void Task_InvokeLocked(void *p);
extern int Task_PostLocked(void *arg0,int arg1,int arg2);
extern int func_02021cd8(Obj *);
extern void *func_02022290(int);
extern int func_020224c0(char *,int,int);
extern int func_02022644(Entry **,State *,Vec *);
extern int func_0202290c(char *,State *,Vec *);
extern int func_02022d54(Query *);
extern int func_0202928c(Obj *,Arg *);
extern int func_02029458(Obj *);
extern int func_02029624(Obj *);
extern int func_020296cc(Obj *,Input *,int);
extern int func_020298f8(Obj *);
extern int func_020299c4(Obj *);
extern int func_02029b6c(Obj *,int,int,int,int);
extern int func_02029c30(Obj *,int,int);
extern int func_02029c80(Obj *,void *,int,int);
extern int func_02029d40(Obj *,int,int);
extern void func_0209448c(int,int,int);
int func_0202884c(Obj *o) {
 long long offset;
 int stop=0;
 u32 *start=o->script;

 while (!stop && !func_02021cd8(o)) {
  Vec *pos=&o->pos;
  u32 w;
  u32 *s=o->script;
  w=*s;
  switch(w>>24) {
  case 0x80: {
   Arg *a=(Arg *)o->script[1]+func_020224c0((char *)o,(w>>16)&255,(u16)w);
   func_0202928c(o,a); o->arg=a; o->script+=2; break;
  }
  case 0x81: {
   int i=func_020224c0((char *)o,(w>>16)&255,(u16)w);
   int x=o->script[2], y=o->script[3];
   Arg *a=(Arg *)o->script[1]+i;
   Arg copy=*a;
   if(x!=0x80000000) copy.x+=x;
   if(y!=0x80000000) copy.y+=y;
   func_0202928c(o,&copy); o->arg=a; o->script+=4; break;
  }
  case 0x82: {
   int i=func_020224c0((char *)o,(w>>16)&255,(u16)w);
   Input *a=(Input *)o->script[1]+i;
   func_020296cc(o,a,-1); o->input=a; o->script+=2; break;
  }
  case 0x83: {
   int i=func_020224c0((char *)o,(w>>16)&255,(u16)w);
   int x=o->script[2],y=o->script[3];
   Input *a=(Input *)o->script[1]+i;
   Input copy=*a;
   if(x!=0x80000000) copy.x+=x;
   if(y!=0x80000000) copy.y+=y;
   func_020296cc(o,&copy,-1); o->input=a; o->script+=4; break;
  }
  case 0x84: {
   int i=func_020224c0((char *)o,(w>>16)&255,(u16)w);
   Input *a=(Input *)o->script[1]+i;
   func_020296cc(o,a,(short)o->script[2]); o->input=a; o->script+=3; break;
  }
  case 0x85: {
   int x=s[1],y=s[2];
   if(o->b2) { if(x!=0x80000000) o->x=o->arg->x+x; if(y!=0x80000000) o->y=o->arg->y+y; }
   else { if(x!=0x80000000) o->xx=o->input->x+x; if(y!=0x80000000) o->yy=o->input->y+y; }
   o->script+=3; break;
  }
  case 0x86: {
   if(o->b6) { Query q; q.type=0;q.id=(int)o;q.mode=0;func_02022d54(&q); }
   if(o->b2) func_02029458(o); else func_020298f8(o);
   o->script++;break;
  }
  case 0x87: o->screen=func_020224c0((char *)o,(w>>16)&255,(u16)w);o->script++;break;
  case 0x88: o->b1=(u16)func_020224c0((char *)o,(w>>16)&255,(u16)w);o->script++;break;
  case 0x89:
   pos->x=(short)func_020224c0((char *)o,(w>>16)&255,(u16)s[1])<<4;
   pos->y=(short)func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)(o->script[1]>>16))<<4;
   o->state.v=*pos;o->script+=3;break;
  case 0x8a: if(func_02022644((Entry **)o,&o->state,pos)) stop=1;break;
  case 0x8b: {
   int a=func_020224c0((char *)o,(w>>16)&255,(u16)s[1]);
   int b=func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)(o->script[1]>>16));
   o->h18e=a;o->h190=b;o->script+=2;break;
  }
  case 0x8c: o->b3=(u16)func_020224c0((char *)o,(w>>16)&255,(u16)w);o->script++;break;
  case 0x8d: o->b5=(u16)func_020224c0((char *)o,(w>>16)&255,(u16)w);o->script++;break;
  case 0x8e: {
   int a=(short)func_020224c0((char *)o,(w>>20)&15,(u16)s[2]);
   int b=func_020224c0((char *)o,(o->script[0]>>16)&15,(u16)(o->script[2]>>16));
   func_02029b6c(o,(u16)o->script[1],(u16)(o->script[1]>>16),a,b);o->script+=3;break;
  }
  case 0x8f: {
   int a=(short)func_020224c0((char *)o,(w>>20)&15,(u16)w);
   int b=func_020224c0((char *)o,(o->script[0]>>16)&15,(u16)o->script[1]);
   func_02029c30(o,a,b);o->script+=2;break;
  }
  case 0x90: o->h8c=func_020224c0((char *)o,(w>>16)&255,(u16)w);o->script++;break;
  case 0x4e:
   switch((w>>16)&15) {
   case 0: o->name=(void *)s[1];o->script+=2;break;
   case 1: { int i=func_020224c0((char *)o,(w>>20)&15,(u16)w);o->name=((void **)o->script[1])[i];o->script+=2;break; }
   case 2: o->name=func_02022290(func_020224c0((char *)o,(w>>20)&15,(u16)w));o->script++;break;
   }
   func_02029624(o);break;
  case 0x6b: o->script=s+4;break;
  case 0x6c:
   if(o->b6) stop=1;
   else {
    int y=o->b2?o->y:o->yy;
    offset=s[1]; int size=s[2]*2;
    int a=func_020224c0((char *)o,(w>>16)&255,(u16)s[3]);
    int b=func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)(o->script[3]>>16));
    int c=func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)o->script[4]);
    void *p=(void *)Task_PostLocked((void *)size,4,0);
    func_0209448c((u16)(a|(b<<5)|(c<<10)),(int)p,size);
    func_02029c80(o,p,y+(int)offset,size);Task_InvokeLocked(p);o->script+=5;
   } break;
  case 0x6d: {
   int a=func_020224c0((char *)o,(w>>20)&15,(u16)s[1]);
   int b=(short)func_020224c0((char *)o,(o->script[0]>>16)&15,(u16)(o->script[1]>>16));
   func_02029d40(o,a,b);o->script+=2;break;
  }
  case 0x6e: if(o->b6) stop=1;else o->script=s+1;break;
  }
  if(o->script!=start) o->timer=0;
 }
 if(o->b0 && !o->b2) func_020299c4(o);
 if(o->b0 && o->state.flag) func_0202290c((char *)o,&o->state,&o->pos);
 o->timer++;
 return 1;
}
