typedef struct { int x,y; } Pair;
typedef struct Obj { int f0,f4,kind,fc,f10,f14,state,value; } Obj;
typedef struct State {
 int f0,f4,f8,fc,f10,f14,f18,f1c,f20,f24,f28;
 char pad2c[0x24]; int f50; char pad54[0xc]; int f60;
 char pad64[0x130]; int f194; Obj objects[3];
 char scroll[0x24]; unsigned char f21c; char pad21d[0x17]; int f234;
} State;
typedef struct { char pad[4]; int f4; char pad8[0x2c]; int f34; } ObjA16;
struct F022afb8c_Self;
struct Self0229f160;
typedef struct Self Self;
extern void func_02006110(int *,int *);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02006228(void);
extern int func_02037208(int,int,int,int);
extern int func_ov002_021afaf0(void);
extern void *func_ov002_021afbc4(void);
extern int func_ov002_0229f160(struct Self0229f160 *,int,int);
extern void func_ov002_0229f1e0(Obj *);
extern int func_ov002_022a0f8c(Self *,int);
extern void func_ov002_022a10fc(State *,int);
extern int func_ov002_022a16b0(ObjA16 *);
extern Pair func_ov002_022a2a40(State *,int);
extern void func_ov002_022ac67c(State *);
extern void func_ov002_022ac9ec(State *,int);
extern int func_ov002_022afcf0(struct F022afb8c_Self *);
void func_ov002_022acd4c(State *s) {
 int x,y;

 int n,i,index;
 func_02006110(&x,&y);
 y-=func_ov002_022a16b0((ObjA16 *)s);
 if (func_ov002_022afcf0((struct F022afb8c_Self *)s->scroll)) {
  index=s->f21c ? s->f234 : 0;
  if(s->f28!=index) {s->f28=index; func_ov002_022ac67c(s);}
  return;
 }
 n=(int)func_ov002_021afbc4()>6 ? 6 : (int)func_ov002_021afbc4();
 if(y>=24 && y<40 && x>=36 && x<228) {
  index=(x-36)/24;
  if(func_02006164()) {
   func_ov002_022ac9ec(s,index);
   s->f60=0;
   func_02037208(0x3a,-1,0,1);
   return;
  }
 }
 Pair pos=func_ov002_022a2a40(s,0);
 if(y>=pos.y-16 && y<pos.y+16) {
  if(x<pos.x-16) {
   if(s->f28>0) {
    if(--s->f50<=-16) {
     s->f50=-8;
     func_ov002_022a10fc(s,s->f28-1);
     func_02037208(0x38,-1,0,3);
     s->f60=0;
    }
   }
   return;
  }
  if(x<func_ov002_022a2a40(s,n-1).x+16) {
   if((x-(pos.x-20))%32<8) s->f18=1;
   else {
    index=s->f28+(x-(pos.x-16))/32;
    if(s->f20!=index) {
     func_ov002_022a10fc(s,index);
     func_02037208(0x38,-1,0,3);
     s->f60=0;
    } else if(func_02006228()) {
     n=func_ov002_021afaf0();
     if(n>1 || s->f4==-72) {
      if(s->objects[1].f0) func_ov002_0229f1e0(&s->objects[1]);
      else if(s->objects[2].f0) func_ov002_0229f1e0(&s->objects[2]);
     } else if(n) func_ov002_0229f1e0(&s->objects[0]);
    }
    s->f20=index;
   }
   s->f50=0;
   return;
  }
  if(s->f28+6<(int)func_ov002_021afbc4()) {
   if(++s->f50>=16) {
    s->f50=8;
    func_ov002_022a10fc(s,s->f28+6);
    func_02037208(0x38,-1,0,3);
    s->f60=0;
   }
  }
  return;
 }
 s->f50=0;
 for(i=0;i<s->f194;i++) {
  if(func_ov002_0229f160((struct Self0229f160 *)&s->objects[i],x,y)) {
   s->f14=i; s->f60=1;
   if(func_ov002_022a0f8c((Self *)s,s->f20)) {
    if(func_02006194()) { s->objects[i].f4=1; return; }
    if(func_0200617c()) func_ov002_0229f1e0(&s->objects[i]);
    return;
   }
  }
 }
}

