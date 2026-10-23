typedef unsigned short u16;
typedef struct { int index; u16 first,last,previous; } State;
typedef struct { int x,y; } Vec;
typedef struct { unsigned short id:14; unsigned short flags:2; short x,y; char pad[0x5a]; } Item;
typedef struct { int id; short x0,y0,x1,y1; } Hit;
typedef struct {
 char pad0[0x16]; u16 h; char pad18[0x10]; Hit *hits;
 int f2c,x,pos; u16 used,pad3a; Item *items; void **images;
 int f44,f48,remaining,duration,mode,base;
 unsigned short f0:4; unsigned short count:2; unsigned short rest:10;
 u16 pad5e; int f60; void (*hit)(int,short *); void (*done)(void);
} Obj;
extern u16 func_0207ec28(State *s);
extern void func_02006110(int *out_a,int *out_b);
extern unsigned int func_02006164(void);
extern long long func_020b3870(int,int);
extern u16 func_0207f934(void *,u16,void *,void *,Vec *,u16,int);
int func_ov005_021ab858(Obj *p,int step,State *s,char **out) {
 int available=func_0207ec28(s);
 int changed=0;
 int delta;
 if(p->remaining>0) {
  switch(p->mode) { case 1: delta=-16; break; case 2: delta=16; break; }
  p->remaining-=step;
  if(p->remaining<0) p->remaining=0;
  p->pos=p->base+(int)func_020b3870(delta*(p->duration-p->remaining),p->duration);
  if(p->remaining==0) {
   p->duration=0; p->mode=0; p->pos=p->base+delta;
   if(p->done) p->done();
  }
  changed=1;
 }
 if(p->hits && p->hit && ((*(volatile u16 *)0x04000304 & 0x8000)>>15)==1 && func_02006164()) {
  int x,y;
  Hit *hit=p->hits;
  int i;
  func_02006110(&x,&y);

  for(i=0;i<(p->h*8)/16+2;i++,hit++) {
   if(hit->id && x>=hit->x0 && x<=hit->x1 && y>=hit->y0 && y<=hit->y1) {
    p->hit(hit->id,&hit->x0);
    break;
   }
  }
 }
 p->used=0;
 if(p->count) {
  Item *item=p->items;
  int i;
  Vec v;
  for(i=0;i<p->count*((p->h*8)/16+2);i++,item++) {
   if(item->id!=0x3fff) {
    int n;
    v.x=item->x<<12; v.y=item->y<<12;
    n=func_0207f934(*out,(u16)available,p->images[item->id],0,&v,0,0);
    available-=n;
    *out+=n*8;
    p->used+=n;
   }
  }
 }
 return changed;
}


