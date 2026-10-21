struct Entry { int a,b; };
struct S {
 char pad0[0x2c]; void *cell; char pad30[0x24];
 short x,y,right,bottom; int index,min,max,state; short height,pad6e; volatile int timer;
 unsigned int disabled:1; unsigned int rest:31;
};
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0,int r1,int r2,int r3);
extern int func_0207ec28(void *p);
/* This caller passes dt in r1 in addition to the C definition's p. */
extern int func_0207fd28(void *p, int dt);
extern int func_0207f934(void *out, unsigned short count, void *cell, void *matrix, int *pos, int a, int b);
extern int func_020b3870(int a,int b);
extern void func_ov010_021b3a14(void *p,int v);
int func_ov010_021b3774(struct S *p,int dt,void *anim,struct Entry **out) {
 int count = func_0207ec28(anim);
 int timer = p->timer;
 int offset;
 int old = p->index;
 offset = 0;
 int pos[2];
 int x,y;
 if(timer>0) {
  int remaining;
  timer -= dt;
  p->timer = timer;
  if(timer<0) p->timer=0;
  timer = p->timer;
  remaining = 0x5000-timer;
  switch(p->state) {
  case 2:
   offset = (-p->height * remaining)/5;
   if(timer==0) { p->index--; p->state=1; offset=0; }
   break;
  case 3:
   offset = (p->height * remaining)/5;
   if(timer==0) { p->index++; p->state=1; offset=0; }
   break;
  }
 } else {
  if(!p->disabled) {
   if(func_02006194()) {
    func_02006110(&x,&y);
    if(x>=p->x && x<=p->right && y>=p->y && y<=p->bottom)
     func_ov010_021b3a14(p,func_020b3870(y-p->y,p->height));
    p->state=4;
   } else p->state=1;
  } else p->state=1;
 }
 if(p->index<p->min) p->index=p->min;
 else if(p->index>p->max) p->index=p->max;
 if(old!=p->index) func_02037208(0x38,-1,0,1);
 func_0207fd28(p,dt);
 { void *cell=p->cell;
 int used;
 pos[0]=p->x<<12;
 pos[1]=offset+((p->y+p->height*p->index)<<12);
 used=func_0207f934(*out,(unsigned short)count,cell,0,pos,0,0);
 *out = used + *out;
 return used;
 }
}









