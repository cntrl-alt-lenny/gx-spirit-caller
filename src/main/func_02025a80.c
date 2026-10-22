typedef struct { unsigned int w[12]; } blob48_02023244_t;
typedef struct { int f0,f4,f8,fc,f10,f14,f18,f1c,f20; } S0208b190;
typedef struct { unsigned short x,y,z; } Vertex;
typedef struct { short u,v; } UV;
typedef struct {
 char pad[0x68]; short mode,count; Vertex *vertices; UV *uv; void *texture;
 unsigned char format,us,vs,texflags; unsigned int texaddr; int palette;
 char pad84[0x28]; int x,y,z; int rx,ry,rz; int sx,sy,sz; int alpha;
 char padd4[8]; int dx,dy,dz; char pade8[0x7a]; short anim,animoff;
 char pad166[4]; unsigned short b0:1,b1:1,b2:1,b3:1,b4:1,b5:1,b6:1,b7:1,rest:8;
} Obj;
typedef struct { char pad[0x2c]; short start,end,value,pad32,counter; } State;
extern State data_0219a8ec;
extern short data_020bef80[];
extern int data_020c68cc[];
extern int func_02023244(blob48_02023244_t *dst);
extern void func_0208b190(S0208b190 *p,int b,int a);
extern void func_0208b1ac(S0208b190 *p,int b,int a);
extern void func_0208b1c8(S0208b190 *p,int b,int a);
extern int func_0208e3e8(int x);
extern int func_0208e404(int x);
int func_02025a80(Obj *o) {
 S0208b190 rot;
 blob48_02023244_t world;
 Vertex *v=o->vertices;
 UV *uv=o->uv;
 int poly=0;
 State *state=&data_0219a8ec;
 int a,i,j,k,n;
 *(volatile int *)0x04000444=0;
 { int x=o->x+o->dx, z=o->z+o->dz, y=o->y+o->dy;
 *(volatile int *)0x04000470=x; *(volatile int *)0x04000470=y; *(volatile int *)0x04000470=z; }
 if(o->rx || o->ry || o->rz) {
  a=(unsigned short)(o->rz<<4);
  if(a) { a>>=4; func_0208b1c8(&rot,data_020bef80[a*2],data_020bef80[a*2+1]); func_0208e3e8((int)&rot); }
  a=(unsigned short)(o->ry<<4);
  if(a) { a>>=4; func_0208b1ac(&rot,data_020bef80[a*2],data_020bef80[a*2+1]); func_0208e3e8((int)&rot); }
  a=(unsigned short)(o->rx<<4);
  if(a) { a>>=4; func_0208b190(&rot,data_020bef80[a*2],data_020bef80[a*2+1]); func_0208e3e8((int)&rot); }
 }
 if(o->sx!=0x1000 || o->sy!=0x1000 || o->sz!=0x1000) {
  int x=o->sx,z=o->sz,y=o->sy;
  *(volatile int *)0x0400046c=x; *(volatile int *)0x0400046c=y; *(volatile int *)0x0400046c=z;
 }
 if(o->b3) { func_02023244(&world); func_0208e404((int)&world); }
 *(volatile int *)0x040004c0=0x7fff7fff;
 *(volatile int *)0x040004c4=0x4210;
 if(o->texture && o->uv) {
  int transparent=0;
  if(o->texflags&1) transparent=1;
  *(volatile unsigned int *)0x040004a8=(o->texaddr>>3)|(o->format<<26)|0x40000000|(o->us<<20)|(o->vs<<23)|(transparent<<29);
  a=o->palette; if(a<0) a=0;
  *(volatile int *)0x040004ac=(unsigned int)a>>(4-(o->format==2));
 } else { *(volatile int *)0x040004a8=0; }
 switch(o->anim) {
 case 0: break;
 case 1: { int start=state->start; int count=state->counter; state->counter=count+1; poly=start+count; if(state->counter>=state->end) state->counter=0; break; }
 case 2: poly=state->value+o->animoff; break;
 }
 a=(o->b7 || o->b4)?0x800:0;
 *(volatile int *)0x040004a4=a|0x81|(poly<<24)|((o->alpha>>4)<<16);
 *(volatile int *)0x04000500=o->mode;
 *(volatile int *)0x04000484=0x10000;
 switch(o->mode) {
 case 0:
  for(i=0;i<o->count;i++) {
   for(j=0;j<3;j++) {
    int n=j+i*3;
    unsigned int x=v[n].x,y=v[n].y,z=v[n].z;
    *(volatile int *)0x0400048c=x|(y<<16);
    *(volatile int *)0x0400048c=z;
   }
  }
  break;
 case 1: {
  i=0;
  if(o->count>0) {
  k=0;
  do {
   for(j=0;j<4;j++) {
    n=j+k;
    if(o->texture && o->uv) {
     short u=(short)((data_020c68cc[o->us]*uv[n].u)>>8);
     short t=(short)((data_020c68cc[o->vs]*uv[n].v)>>8);
     *(volatile int *)0x04000488=(unsigned short)u|((unsigned short)t<<16);
    }
    { unsigned int x=v[n].x,y=v[n].y,z=v[n].z;
    *(volatile int *)0x0400048c=x|(y<<16);
    *(volatile int *)0x0400048c=z; }
   }
   i++; k+=4;
  } while(i<o->count);
  }
  break;
 }
 case 2: case 3: break;
 }
 *(volatile int *)0x04000504=0;
 *(volatile int *)0x04000448=1;
 return 1;
}






