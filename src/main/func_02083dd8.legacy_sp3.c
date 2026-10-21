typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct Mat { u32 flags; int pad[9]; int m[9]; int v[3]; };
struct Ctx;
struct Handler { char pad[0x10]; void *arg; int (*load)(struct Mat *,void *,int); char pad18[0x1c]; struct Mat *table; };
struct Ctx {
 u8 *pc; struct Handler *handler; u32 flags; char padc[0x18];
 void (*cb)(struct Ctx *); char pad28[0x6a]; u8 state; char pad93[0x1b]; u8 id; char padaf[5];
 struct Mat *out; char padb8[0x1c]; u8 *data; char padd8[0x10];
 void (*decode)(struct Mat *,short *,u8 *,int); void (*emit)(struct Mat *); char padf0[0x3c]; struct Mat local;
};
extern void func_02084e0c(int cmd,void *src,int n);
extern void func_020947b8(void *dst);
extern u8 data_020bef5c[][4];
void func_02083dd8(struct Ctx *c,int mode)
{
 int id = c->pc[1];
 int len = 4;
 int st;
 int busy;
 struct Mat *mat;
 short *p;
 u16 *h;
 int axis;
 int x,y;
 c->id = id;
 c->flags |= 0x10;
 if (c->flags & 0x400) {
  if (mode==0x40 || mode==0x60) len++;
  if (mode==0x20 || mode==0x60) {
   len++;
   if (!(c->flags & 0x100)) { int v=c->pc[4]; func_02084e0c(0x14,&v,1); }
  }
  c->pc += len;
  return;
 }
 if (mode==0x40 || mode==0x60) {
  int v;
  len++;
  if (mode==0x40) v=c->pc[4]; else v=c->pc[5];
  if (!(c->flags & 0x100)) func_02084e0c(0x14,&v,1);
 }
 c->out=&c->local;
 if(c->cb!=0) st=c->state; else st=0;
 if(st==1) {
  c->flags &= ~0x40;
  c->cb(c);
  if(c->cb!=0) st=c->state; else st=0;
  busy=c->flags&0x40;
 } else busy=0;
 if(busy==0) {
  if(c->handler->table!=0) { mat=&c->handler->table[id]; busy=!(c->flags&0x80); }
  else { mat=&c->local; busy=0; }
  if(busy==0) {
   mat->flags=0;
   if(c->handler->arg==0 || c->handler->load(mat,c->handler->arg,id)==0) {
    u8 *data=c->data;
    u8 *table=data+*(u16 *)(data+6);
    h=(u16 *)(data+*(int *)(table+*(u16 *)table*id+4));
    p=(short *)(h+2);
    if(*h&1) mat->flags|=4;
    else { mat->v[0]=*(int *)p; mat->v[1]=*(int *)(p+2); mat->v[2]=*(int *)(p+4); p+=6; }
    if(*h&2) mat->flags|=2;
    else if(*h&8) {
     axis=(*h&0xf0)>>4;
     x=p[0]; y=p[1];
     func_020947b8(mat->m);
     mat->m[axis]=(*h&0x100)?-0x1000:0x1000;
     p+=2;
     mat->m[data_020bef5c[axis][0]]=x;
     mat->m[data_020bef5c[axis][1]]=y;
     if(*h&0x200) y=-y;
     mat->m[data_020bef5c[axis][2]]=y;
     if(*h&0x400) x=-x;
     mat->m[data_020bef5c[axis][3]]=x;
    } else {
     mat->m[0]=((short *)h)[1];
     mat->m[1]=p[0];mat->m[2]=p[1];mat->m[3]=p[2];mat->m[4]=p[3];mat->m[5]=p[4];mat->m[6]=p[5];mat->m[7]=p[6];mat->m[8]=p[7];p+=8;
    }
    c->decode(mat,p,c->pc,*h);
   }
  }
  c->out=mat;
 }
 if(st==2) {
  c->flags &= ~0x40; c->cb(c);
  if(c->cb!=0) st=c->state; else st=0;
  busy=c->flags&0x40;
 } else busy=0;
 if(busy==0) { if(!(c->flags&0x100)) c->emit(c->out); }
 c->out=0;
 if(st==3) { c->flags &= ~0x40; c->cb(c); busy=c->flags&0x40; } else busy=0;
 if(mode==0x20 || mode==0x60) {
  len++;
  if(busy==0 && !(c->flags&0x100)) { int v=c->pc[4]; func_02084e0c(0x13,&v,1); }
 }
 c->pc+=len;
}

