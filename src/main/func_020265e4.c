typedef struct { int x,y,z; } Vec;
typedef struct {
 unsigned int b0:4; unsigned int b4:1; unsigned int b5:1; unsigned int b6:1; unsigned int b7:1; unsigned int b8:1; unsigned int b9:4; unsigned int b13:1; unsigned int b14:3; unsigned int b17:4; unsigned int rest:11;
} F60;
typedef struct {
 unsigned int alpha:5; unsigned int id:6; unsigned int pad11:10; unsigned int mode:4; unsigned int b25:1; unsigned int pad26:3; unsigned int b29:1; unsigned int b30:1; unsigned int b31:1;
} F7c;
typedef struct { char pad[0x34]; Vec pos; unsigned short rx,ry,rz; short pad46; Vec scale; char pad54[12]; F60 f60; unsigned short h64; char pad66[22]; F7c f7c; } Dest;
typedef struct { unsigned short b0:1,b1:1,b2:1,b3:1,b4:1,b5:1,b6:1,b7:1,b8:1,b9:1,b10:1,b11:1,hi:4; } Flags;
typedef struct Obj02025880 { char pad[0xa4]; Dest *p; int a8; Vec pos; unsigned int rx:12,prx:20; unsigned int ry:12,pry:20; unsigned int rz:12,prz:20; Vec scale; int alpha; int d4,d8; Vec delta; int e8; char padec[0x70]; void *stamp; short old,mode,id,index,p168; Flags flags; } Obj02025880;
typedef struct {int key,val,pad;} Ent;
typedef struct {char pad[0x14]; int n; Ent ents[1];} LookupObj;
typedef struct {char pad[0x2c]; short base,limit,fixed,p32,counter;} Global;
extern Global data_0219a8ec;
extern char *func_0202162c(void);
extern int func_02021660(LookupObj *o,int key,int idx);
extern int func_02025880(Obj02025880 *arg0);
extern int func_0200c428(Dest *o,int mode,int val);
extern void *func_02022224(void);
int func_020265e4(Obj02025880 *o) {
 int x=o->pos.x+o->delta.x;
 int z=o->pos.z+o->delta.z;
 int y=o->pos.y+o->delta.y;
 Global *g;
 int id;
 int alpha;
 int index;
 void *stamp;
 int v;
 { Dest *p=o->p; p->pos.x=x; p->pos.y=y; p->pos.z=z; }
 { unsigned short rx=o->rx<<4, ry=o->ry<<4, rz=o->rz<<4;
 { Dest *p=o->p; p->rx=rx; p->ry=ry; p->rz=rz; } }
 o->p->scale.x=o->scale.x; o->p->scale.y=o->scale.y; o->p->scale.z=o->scale.z;
 g=&data_0219a8ec;
 id=0;
 o->p->f7c.b25=o->flags.b3;
 { switch(o->mode) {
 case 0: break;
 case 1: id=g->base+g->counter; g->counter++; if(g->counter>=g->limit) g->counter=0; break;
 case 2: id=g->fixed+o->id; break;
 }
 } o->p->f7c.id=id;
 o->p->f7c.b29=o->mode==0;
 alpha=o->alpha>>4;
 if(!o->flags.b1) alpha=0;
 if(o->flags.b8) {
 index=o->index;
 if(index<0) { if(func_02025880(o)) alpha=0; }
 else { if(func_02025880((Obj02025880 *)func_02021660((LookupObj *)func_0202162c(),3,index))) alpha=0; }
 }
 if(alpha!=31) {o->p->f7c.alpha=alpha; o->p->f60.b6=1;}
 else o->p->f60.b6=0;
 stamp=func_02022224();
 v=o->e8>>4;
 if(v!=o->old) {func_0200c428(o->p,0,v); o->old=v;}
 o->stamp=stamp;
 if(o->flags.b5) {o->p->h64=0x7fff; o->p->f60.b13=1;}
 else o->p->f60.b13=0;
 o->p->f7c.b30=o->flags.b6;
 o->p->f60.b8=o->flags.b7 || o->flags.b4;
 o->p->f60.b4=o->flags.b9;
 o->p->f60.b17=o->flags.hi;
 o->p->f60.b7=1;
 o->p->f7c.mode=o->flags.b4?1:0;
 return 1;
}









