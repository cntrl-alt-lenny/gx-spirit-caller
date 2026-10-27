struct Ov000Curve {
 unsigned active:1; unsigned :1; unsigned state:4; unsigned x:9; unsigned base:9; unsigned width:8;
 unsigned a:8; unsigned b:8; unsigned c:8; unsigned :8;
 unsigned lo:16; unsigned hi:16;
 unsigned margin:8; signed offset:9; unsigned end:9; signed action:4; unsigned :2;
 signed previous:4; unsigned repeat:5; unsigned :23;
};
struct Ov000LH; struct Ov000Ctr; struct Ov000Ctr2;
extern unsigned func_ov000_021abe64(struct Ov000Curve *p);
extern unsigned func_ov000_021abec8(struct Ov000Curve *p);
extern int func_ov000_021ac098(struct Ov000Curve *p, unsigned x, unsigned y);
extern void func_ov000_021abf78(struct Ov000LH *p);
extern void func_ov000_021abfbc(struct Ov000Ctr *p);
extern void func_ov000_021abfec(struct Ov000LH *p);
extern void func_ov000_021ac050(struct Ov000Ctr2 *p);
extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
void func_ov000_021ac144(struct Ov000Curve *p) {
 int x,y;
 int hit;
 unsigned mid;
 if (!p->active) return;
 p->action=-1;
 p->end=func_ov000_021abe64(p);
 if (!func_02006194() && !func_0200617c()) return;
 func_02006110(&x,&y);
 hit=func_ov000_021ac098(p,x,y);
 switch(p->state) {
 case 0:
  mid=func_ov000_021abe64(p);
  if(func_02006164()) {
   p->action=hit;
   p->previous=p->action;
   p->repeat=0;
   if(p->action==3) {
    p->state=1;
    p->offset=mid-y;
   }
  }
  if(hit==p->previous) {
   if(func_02006194()) p->action=hit;
   if(!(p->repeat & 0xf)) {
    switch(p->action) {
    case 0: break;
    case 1: func_ov000_021abfbc((struct Ov000Ctr *)p); break;
    case 2: func_ov000_021ac050((struct Ov000Ctr2 *)p); break;
    case 3: break;
    case 4: func_ov000_021abfec((struct Ov000LH *)p); break;
    case 5: func_ov000_021abf78((struct Ov000LH *)p); break;
    }
   }
   if(p->repeat<16) p->repeat++;
   else p->repeat=13;
  }
  p->end=func_ov000_021abe64(p);
  break;
 case 1:
  if(func_0200617c()) p->state=0;
  else {
   if((unsigned)y < p->base+p->b-p->offset) p->end=p->base+p->b;
   else if((unsigned)y > p->base+p->a-p->b-p->c-p->offset) p->end=p->base+p->a-p->b-p->c;
   else p->end=y+p->offset;
  }
  p->lo=(unsigned short)func_ov000_021abec8(p);
  p->action=3;
  break;
 }
}

