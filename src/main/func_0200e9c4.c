typedef struct { int m[12]; } Mtx;
typedef struct { int m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23; } mtx33_t;
struct s_020115a8 { int a,z0,z1,z2,b,z3,z4,z5,c,z6,z7,z8; };
struct M43 { int m[12]; };
typedef struct Obj Obj;
struct Obj { char p0[0x34]; int tx,ty,tz; unsigned short rx,ry,rz; char p46[2]; int sx,sy,sz; void (*callback)(Obj *,int); char p58[8]; unsigned int enabled:1, hidden:1, active:1, rest:9, order:1, rest2:19; char p64[0x18]; unsigned int pbits:21, group:4, special:1, rest3:6; int model; signed int flag:1; unsigned int rest4:31; char p88[0x1f4]; Obj *parent; char p280[4]; };
typedef struct { char p[2]; unsigned short field; char p4[8]; int count; char p10[4]; Obj *objects; } Global;
typedef struct { Mtx a,b; char p60[0x48]; int enabled; char pac[4]; void (*callback)(void *); } Camera;
extern Global data_02186ae8;
extern struct M43 data_02186b00;
extern void *func_02011098(int i);
extern void func_0200ac60(void);
extern void func_02011178(Mtx *src, Mtx *dst);
extern void func_020111e4(Mtx *, Mtx *, Mtx *);
extern void func_020115e0(mtx33_t *m,int tx,int ty,int tz);
extern void func_020115a8(struct s_020115a8 *p,int v1,int v2,int v3);
extern void func_02011620(int *m,int angle);
extern void func_02011688(int *m,int angle);
extern void func_020116ec(int *m,int angle);
extern void func_0208b32c(struct M43 *a,struct M43 *b,struct M43 *out);
extern void func_0200c874(Obj *obj,int idx,Mtx *a,Mtx *b);
extern void func_0200cb50(Obj *obj,int idx,Mtx *a,Mtx *b);
void func_0200e9c4(void) {
 int group, i;
 Camera *cam;
 Obj *o;
 Mtx a, b, tmp, baseA, baseB;
 func_02011098(0);
 func_0200ac60();
 data_02186ae8.field=0;
 for(group=0;group<2;group++) {
  cam=func_02011098(group);
  if(cam->enabled) {
   if(cam->callback) cam->callback(cam);
   *(volatile int *)0x04000440=3;
   *(volatile int *)0x04000454=0;
   *(volatile int *)0x04000440=2;
   func_02011178(&cam->a,&baseA);
   func_02011178(&cam->b,&baseB);
   for(i=0;i<data_02186ae8.count;i++) {
    o=&data_02186ae8.objects[i];
    if(o->group==group && (!o->parent || !o->parent->hidden) && !o->hidden && o->enabled && o->active) {
     func_02011178(&baseA,&a);
     func_02011178(&baseB,&b);
     if(o->tx || o->ty || o->tz) {
      func_020115e0((mtx33_t *)&tmp,o->tx,o->ty,o->tz);
      func_020111e4(&a,&tmp,&a);
     }
     if(o->special) func_0208b32c(&data_02186b00,(struct M43 *)&a,(struct M43 *)&a);
     if(o->order) {
      if(o->rx) { func_02011620(tmp.m,o->rx); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
      if(o->ry) { func_02011688(tmp.m,o->ry); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
      if(o->rz) { func_020116ec(tmp.m,o->rz); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
     } else {
      if(o->rz) { func_020116ec(tmp.m,o->rz); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
      if(o->ry) { func_02011688(tmp.m,o->ry); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
      if(o->rx) { func_02011620(tmp.m,o->rx); func_020111e4(&a,&tmp,&a); func_020111e4(&b,&tmp,&b); }
     }
     if(o->sx!=0x1000 || o->sy!=0x1000 || o->sz!=0x1000) {
      func_020115a8((struct s_020115a8 *)&tmp,o->sx,o->sy,o->sz);
      func_020111e4(&a,&tmp,&a);
     }
     if(o->model) { if(o->flag) func_0200cb50(o,0,&a,&b); }
     else func_0200c874(o,0,&a,&b);
     o->callback(o,0);
    }
   }
  }
 }
}


