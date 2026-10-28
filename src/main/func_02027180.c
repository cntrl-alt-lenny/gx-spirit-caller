typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int x,y,z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char flag:1, flags:7; } State;
typedef struct { u32 a,b,c; } Entry;
typedef struct { int a,b,x,y,e,f,g,h; } Record;
typedef struct { int type,id,mode; } Query;
typedef struct Obj {
 u32 *script; int count; char pad08[0x60]; void *resource; char pad6c[4]; int x,y; char pad78[0x10]; Record *record; char pad8c[0x28]; Vec pos; State state; char padd0[4]; short d4,d6; char padd8[6]; u16 active:1, visible:1, b2:1, b3:1, busy:1;
} Obj;
extern int func_02021cd8(Obj *);
extern void *func_02022290(int i);
extern int func_020224c0(char *base, int mode, int val);
extern int func_02022644(Entry **script, State *state, Vec *out);
extern int func_0202290c(char *base, State *state, Vec *out);
extern int func_02022d54(Query *q);
extern int func_020278dc(Obj *, Record *);
extern int func_02027ddc(Obj *);
extern int func_02027e44(Obj *);
extern int func_02027ee4(Obj *);
extern int func_02028024(Obj *);
extern int func_0202813c(Obj *o, int a, int b, int c);
extern int func_02028238(Obj *o, int value, int duration);
extern void func_0209448c(int unused0, int unused1, int unused2);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
int func_02027180(Obj *o) {
 int offset, y;
 u32 *initial;
 Record *saved;


 State *state;
 int stop;




 initial = o->script;
 stop = 0;



 while (!stop && !func_02021cd8(o)) {

  state = &o->state;
  Vec *pos = &o->pos;
  u32 cmd = *o->script;
  int idx;
  switch (cmd >> 24) {
  case 0x70: {
   Record *r;
   idx = func_020224c0((char *)o,(cmd >> 16)&255,(u16)cmd);
   r = (Record *)o->script[1] + idx;
   func_020278dc(o,r);
   o->record = r;
   o->script += 2;
   break;
  }
  case 0x71: {
   Record copy;
   int x,y;
   idx = func_020224c0((char *)o,(cmd >> 16)&255,(u16)cmd);
   
   x = o->script[2]; y = o->script[3];
   saved = (Record *)o->script[1] + idx;
   copy = *saved;
   if (x != (int)0x80000000) copy.x += x;
   if (y != (int)0x80000000) copy.y += y;
   func_020278dc(o,&copy);
   o->record = saved;
   o->script += 4;
   break;
  }
  case 0x72: { int x=o->script[1], y=o->script[2];
   if (x != (int)0x80000000) o->x = o->record->x + x;
   if (y != (int)0x80000000) o->y = o->record->y + y;
   o->script += 3;
   break;
  }
  case 0x73:
   if (o->busy) { Query q; q.type=0; q.id=(int)o; q.mode=0; func_02022d54(&q); }
   func_02027ddc(o); o->script++; break;
  case 0x74:
   o->d4=func_020224c0((char *)o,(cmd>>16)&255,(u16)cmd); o->script++; break;
  case 0x75:
   o->visible=(u16)func_020224c0((char *)o,(cmd>>16)&255,(u16)cmd);
   func_02027ee4(o); o->script++; break;
  case 0x76:
   pos->x=(short)func_020224c0((char *)o,(cmd>>16)&255,(u16)o->script[1]) << 4;
   
   pos->y=(short)func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)(o->script[1]>>16)) << 4;
   state->v=*pos; o->script+=3; break;
  case 0x77:
   if (func_02022644((Entry **)o,state,pos)) stop=1;
   break;
  case 0x78:
   o->d6=func_020224c0((char *)o,(cmd>>16)&255,(u16)cmd);
   func_02028024(o); o->script++; break;
  case 0x4e:
   switch ((cmd>>16)&15) {
   case 0: o->resource=(void *)o->script[1]; o->script+=2; break;
   case 1: idx=func_020224c0((char *)o,(cmd>>20)&15,(u16)cmd); o->resource=((void **)o->script[1])[idx]; o->script+=2; break;
   case 2: idx=func_020224c0((char *)o,(cmd>>20)&15,(u16)cmd); o->resource=func_02022290(idx); o->script++; break;
   }
   func_02027e44(o); break;
  case 0x6b: o->script+=4; break;
  case 0x6c:
   if (o->busy) stop=1;
   else {
    int a,b,c,buf; y=o->y; offset=o->script[1]; void *size = *(void **)&o->script[2];
    a=func_020224c0((char *)o,(cmd>>16)&255,(u16)o->script[3]);
     b=func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)(o->script[3]>>16));
     c=func_020224c0((char *)o,(o->script[0]>>16)&255,(u16)o->script[4]);
    buf=Task_PostLocked(size,4,0);
    func_0209448c((u16)(a | b<<5 | c<<10),buf,(int)size);
    func_0202813c(o,buf,y+offset,(int)size);
    Task_InvokeLocked((void *)buf); o->script+=5;
   } break;
  case 0x6d: {
   int a=func_020224c0((char *)o,(cmd>>20)&15,(u16)o->script[1]);
    idx=func_020224c0((char *)o,(o->script[0]>>16)&15,(u16)(o->script[1]>>16));
   func_02028238(o,a,(short)idx); o->script+=2; break;
  }
  case 0x6e: if (o->busy) stop=1; else o->script++; break;
  }
  if (o->script != initial) o->count=0;
 }
 if (o->active && o->state.flag) func_0202290c((char *)o,&o->state,&o->pos);
 o->count++;
 return 1;
}





















