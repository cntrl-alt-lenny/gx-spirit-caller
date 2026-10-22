typedef struct { char pad0[0xe]; short y; char pad10[0x20]; int x, position; char pad38[0x24]; unsigned short background:2, flags:14; } State;
typedef struct { char pad[0x30]; int f_30, f_34; } state_30_34_t;
typedef struct { char pad0[0xc]; short start; char padE[6]; unsigned short width; char pad16[10]; unsigned short *map; unsigned short palette; } Map;
typedef struct { short left, top, right, bottom; } Rect;
typedef struct { int unk0, scroll; char pad08[0x10]; int active; char pad1c[0x18]; Rect rect[5]; char pad5c[0x14]; unsigned dirty:1, disabled:1, rest:30; char pad74[0x18]; int hit[6]; } ScrollState;
struct Entry { int a,b; };
struct S { char pad0[0x2c]; void *cell; char pad30[0x24]; short x,y,right,bottom; int index,min,max,state; short height,pad6e; int timer; unsigned disabled:1, rest:31; };
struct S575 { char pad[0x56]; short f56, p58, f5a; char p5c[4]; int f60,f64; char p68[4]; short f6c; };
typedef struct { char pad[0xd8]; ScrollState *scroll; char padDC[0x50]; State *bg; } Context;
typedef struct { int id; char pad4[0xc]; char anim[0x1c]; void *scroll; char pad30[0x4c]; void *layout; struct Obj *obj; char selection[0x74]; unsigned disabled:1, spare:31; char padFC[0x124]; unsigned dirty:1, pending:1, rest:30; } Global;
struct Obj { char pad0[0x38]; unsigned short used; char pad3a[0x1a]; int state; };
extern Context data_ov010_021b91b4;
extern Global data_ov010_021b9260;
extern char data_ov010_021b9270[];
extern void func_ov005_021abb00(State *p);
extern int func_ov010_021b2630(ScrollState *p, void *arg1, char **dst);
extern int func_ov010_021b238c(void *arg0);
extern void func_ov010_021b23f4(void *arg0, int arg1);
/* This caller supplies the object in r0 beyond the callee C definition. */
extern int func_ov005_021ac9c8(void *obj);
extern long long func_020b3870(int a,int b);
extern void func_ov005_021abc68(void *obj,int a,int b);
extern void func_ov005_021abe5c(void *p);
extern void func_ov005_021ac91c(Map *o);
extern int func_ov005_021ab858(void *p,int dt,void *anim,void *out);
extern void func_ov005_021abc74(state_30_34_t *p,int *out_a,int *out_b);
extern int func_ov005_021ac984(void *o);
extern int func_ov005_021ac9d0(void *obj,int idx);
extern void func_ov010_021b3a14(void *p,int v);
extern int func_ov005_021ab108(void *p,int n);
extern void func_ov010_021b3734(struct S575 *self,int a1,int a2);
extern int func_ov010_021b3774(struct S *p,int dt,void *anim,struct Entry **out);
int func_ov010_021b4884(void *out) {
 Global *g=&data_ov010_021b9260;
 int total=0, pos, n, rem, i;
 int x,y;
 func_ov005_021abb00(data_ov010_021b91b4.bg);
 total+=func_ov010_021b2630(data_ov010_021b91b4.scroll,data_ov010_021b9270,out);
 pos=func_ov010_021b238c(data_ov010_021b91b4.scroll);
 if(data_ov010_021b91b4.scroll->active) {
  g->dirty=1;
 } else if(g->obj->state==0) {
  n=func_ov005_021ac9c8(g->obj);
  if(n>0) {
   rem=(int)(func_020b3870(pos,n)>>32);
   if(rem >= (n>>1)) { pos+=n; g->dirty=1; pos-=rem; }
   else if(rem>0) { pos-=rem; g->dirty=1; }
   func_ov010_021b23f4(g->scroll,pos);
  }
 }
 func_ov005_021abc68(g->obj,0,pos);
 if(g->dirty==1) {
  g->dirty=0;
  func_ov005_021abe5c(g->obj);
  func_ov005_021ac91c((void *)g->obj);
 }
 i=func_ov005_021ab858(g->obj,0x1000,g->anim,out);
 total+=g->obj->used;
 if(i==1) {
  func_ov005_021abc74((void *)g->obj,&x,&y);
  func_ov010_021b23f4(g->scroll,y);
  g->dirty=1;
 }
 if(g->pending==1 && !g->dirty) {
  n=func_ov005_021ac984(g->obj);
  for(pos=0;pos<n;pos++) {
   if(g->id==func_ov005_021ac9d0(g->obj,pos)) {
    func_ov010_021b3a14(g->selection,pos);
    break;
   }
  }
  g->pending=0;
 }
 n=func_ov005_021ab108(g->layout,4);
 n--;
 func_ov010_021b3734((void *)g->selection,0,n);
 i=(g->disabled == 1);
 if(!i==1) total+=func_ov010_021b3774((void *)g->selection,0x1000,g->anim,out);
 return total;
}



