typedef struct { int m[12]; } Mtx;
struct s_020115a8 { int a,z0,z1,z2,b,z3,z4,z5,c,z6,z7,z8; };
typedef struct { int m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23; } mtx33_t;
typedef struct {
 char pad[0x41]; signed char parent,child; char pad43[5];
 int sx,sy,sz; unsigned short rx,ry,rz; short pad5a; int tx,ty,tz;
} Node;
typedef struct {
 char pad[8]; Node *nodes; int *indices; Mtx *matrices; char pad14[12];
 int count; char pad24[12]; int shift; char pad34[0x50]; int f84;
} Obj;
typedef struct { char p[0x48]; int sx,sy,sz; unsigned short rx,ry,rz; short p5a; int tx,ty,tz; } Anim;
typedef struct { char p[0xd4]; int f; } Glob;
extern Glob data_02186ae8;
extern Anim data_02186b60;
extern void func_0200bd90(Obj *obj,int idx,int shift,Anim *out);
extern Mtx data_021883c8[],data_02186bc8[],data_0218b3c8[],data_02189bc8[];
extern Mtx data_02186b30;
extern void func_02011178(Mtx *src,Mtx *dst);
extern void func_020111e4(Mtx *,Mtx *,Mtx *);
extern void func_02011100(int *p,int shift);
extern void func_020115a8(struct s_020115a8 *p,int v1,int v2,int v3);
extern void func_020115e0(mtx33_t *m,int tx,int ty,int tz);
extern void func_02011620(int *m,int angle);
extern void func_02011688(int *m,int angle);
extern void func_020116ec(int *m,int angle);
extern void func_0208e420(void *m);
void func_0200cb50(Obj *obj,int idx,Mtx *a,Mtx *b) {
 char *baseB;
 Mtx *baseA;
 Node *n;
 int matrixOffset, i;
 Mtx *baseD;
 Anim *an;

 if (!obj) return;
 i=idx*0x68;
 n=(Node *)((char *)obj->nodes+i);
 if (!n) return;
 matrixOffset=idx*0x30;
 baseA=data_021883c8;
 baseB=(char *)data_02186bc8;
 func_02011178(a,(Mtx *)((char *)baseA+matrixOffset));
 func_02011178(b,(Mtx *)(baseB+matrixOffset));
 func_02011178(a,(Mtx *)((char *)data_0218b3c8+matrixOffset));
 baseD=data_02189bc8;
 func_02011178(b,(Mtx *)((char *)baseD+matrixOffset));
 an=&data_02186b60;
 func_0200bd90(obj,idx,(obj->f84<<10)>>16,an);
 if (data_02186ae8.f || an->ty || an->tz) {
  func_020115e0((mtx33_t *)&data_02186b30,an->tx,an->ty,an->tz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
 }
 if (an->rz) {
  func_020116ec(data_02186b30.m,an->rz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (an->ry) {
  func_02011688(data_02186b30.m,an->ry);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (an->rx) {
  func_02011620(data_02186b30.m,an->rx);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (an->sx!=0x1000 || an->sy!=0x1000 || an->sz!=0x1000) {
  func_020115a8((struct s_020115a8 *)&data_02186b30,an->sx,an->sy,an->sz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
 }
 i=idx*0x68;
 n=(Node *)((char *)obj->nodes+i);
 if (!n) return;
 if (n->parent!=-1) func_0200cb50(obj,n->parent,(Mtx *)((char *)baseA+matrixOffset),(Mtx *)(baseB+matrixOffset));
 if (!obj->matrices) {
  for(i=0;i<obj->count;i++) {
   if(idx==obj->indices[i]) {
    *(volatile int *)0x04000440=2;
    func_0208e420((Mtx *)(baseB+matrixOffset));
    *(volatile int *)0x0400044c=i;
    *(volatile int *)0x04000440=1;
    func_02011100(((Mtx *)((char *)baseA+matrixOffset))->m,obj->shift);
    func_0208e420((Mtx *)((char *)baseA+matrixOffset));
    *(volatile int *)0x0400044c=i;
    break;
   }
  }
 } else {
  for(i=0;i<obj->count;i++) {
   if(idx==obj->indices[i]) {
    func_02011100(((Mtx *)((char *)baseA+matrixOffset))->m,obj->shift);
    i*=2;
    func_02011178((Mtx *)((char *)baseA+matrixOffset),&obj->matrices[i]);
    func_02011178((Mtx *)(baseB+matrixOffset),&obj->matrices[i+1]);
    break;
   }
  }
 }
 if(n->child!=-1) func_0200cb50(obj,n->child,(Mtx *)((char *)data_0218b3c8+matrixOffset),(Mtx *)((char *)baseD+matrixOffset));
}
