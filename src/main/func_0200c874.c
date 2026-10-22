typedef struct { int m[12]; } Mtx;
struct s_020115a8 { int a,z0,z1,z2,b,z3,z4,z5,c,z6,z7,z8; };
typedef struct { int m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23; } mtx33_t;
typedef struct {
 char pad[0x41]; signed char parent,child; char pad43[5];
 int sx,sy,sz; unsigned short rx,ry,rz; short pad5a; int tx,ty,tz;
} Node;
typedef struct {
 char pad[8]; Node *nodes; int *indices; Mtx *matrices; char pad14[12];
 int count; char pad24[12]; int shift;
} Obj;
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
extern int func_0208e420(int x);
void func_0200c874(Obj *obj,int idx,Mtx *a,Mtx *b) {
 int baseB;
 Mtx *baseA;
 Node *n;
 int matrixOffset, i;
 Mtx *baseD;

 if (!obj) return;
 i=idx*0x68;
 n=(Node *)((char *)obj->nodes+i);
 if (!n) return;
 matrixOffset=idx*0x30;
 baseA=data_021883c8;
 baseB=(int)data_02186bc8;
 func_02011178(a,(Mtx *)((char *)baseA+matrixOffset));
 func_02011178(b,(Mtx *)(baseB+matrixOffset));
 func_02011178(a,(Mtx *)((char *)data_0218b3c8+matrixOffset));
 baseD=data_02189bc8;
 func_02011178(b,(Mtx *)((char *)baseD+matrixOffset));
 if (n->tx || n->ty || n->tz) {
  func_020115e0((mtx33_t *)&data_02186b30,n->tx,n->ty,n->tz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
 }
 if (n->rz) {
  func_020116ec(data_02186b30.m,n->rz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (n->ry) {
  func_02011688(data_02186b30.m,n->ry);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (n->rx) {
  func_02011620(data_02186b30.m,n->rx);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
  func_020111e4((Mtx *)(baseB+matrixOffset),&data_02186b30,(Mtx *)(baseB+matrixOffset));
 }
 if (n->sx!=0x1000 || n->sy!=0x1000 || n->sz!=0x1000) {
  func_020115a8((struct s_020115a8 *)&data_02186b30,n->sx,n->sy,n->sz);
  func_020111e4((Mtx *)((char *)baseA+matrixOffset),&data_02186b30,(Mtx *)((char *)baseA+matrixOffset));
 }
 i=idx*0x68;
 n=(Node *)((char *)obj->nodes+i);
 if (!n) return;
 if (n->parent!=-1) func_0200c874(obj,n->parent,(Mtx *)((char *)baseA+matrixOffset),(Mtx *)(baseB+matrixOffset));
 if (!obj->matrices) {
  for(i=0;i<obj->count;i++) {
   if(idx==obj->indices[i]) {
    *(volatile int *)0x04000440=2;
    func_0208e420((int)(Mtx *)(baseB+matrixOffset));
    *(volatile int *)0x0400044c=i;
    *(volatile int *)0x04000440=1;
    func_02011100(((Mtx *)((char *)baseA+matrixOffset))->m,obj->shift);
    func_0208e420((int)(Mtx *)((char *)baseA+matrixOffset));
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
 if(n->child!=-1) func_0200c874(obj,n->child,(Mtx *)((char *)data_0218b3c8+matrixOffset),(Mtx *)((char *)baseD+matrixOffset));
}







