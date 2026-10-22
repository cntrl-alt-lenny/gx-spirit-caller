typedef struct { short left, top, right, bottom; } Rect;
typedef struct {
 int field0, offset; char pad8[0x10]; int active; char pad1c[0x18];
 Rect rects[5]; char pad5c[0x14]; unsigned int flag0:1, flag1:1, other:30;
 int cells[6]; int hit[6];
} Widget;
typedef struct { char pad0[0xe]; short y; char pad10[0x20]; int x, position; char pad38[0x24]; unsigned short background:2, flags:14; } State;
typedef struct { char _pad[0x30]; int f_30, f_34; } state_30_34_t;
typedef struct { char pad0[0xc]; short start; char padE[6]; unsigned short width; char pad16[10]; unsigned short *map; unsigned short palette; } Map;
struct S575;
typedef struct { unsigned dirty:1, selected:1, rest:30; } Flags;
extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
extern long long func_020b3870(int, int); /* quotient r0, remainder r1 */
extern void func_ov005_021abb00(State *p);
extern int func_ov015_021b2630(Widget *self, void *rng, char **dst);
extern int Ov015_UpdateScrollTarget(void *o);
/* C definition has (void); original caller supplies its object pointer. */
extern int func_ov005_021ac9c8(void *);
extern void func_ov015_021b23f4(void *arg0, int arg1);
extern void func_ov005_021abc68(void *obj, int a, int b);
extern void func_ov005_021abe5c(void *);
extern void func_ov005_021ac91c(Map *o);
extern int func_ov005_021ab858(void *, int, void *, char **);
extern void func_ov005_021abc74(state_30_34_t *p, int *out_a, int *out_b);
extern int func_ov005_021ac984(void *o);
extern int func_ov005_021ac9d0(void *obj, int idx);
extern void func_ov015_021b3520(void *p, int v);
extern int func_ov005_021ab108(void *, int);
extern void func_ov015_021b3240(struct S575 *self, int a1, int a2);
extern int func_ov015_021b3280(void *, int, void *, char **);
#define W (*(Widget **)(s+0x848))
#define O (*(void **)(s+0x878))
#define F ((Flags *)(s+0xa84))
int func_ov015_021b405c(void *rng, char **dst) {
 char *s = data_ov015_021b5e44;
 int total = 0;
 int target, height, rem;
 int x, y;
 
 if (*(int *)(data_ov015_021b5e28+0x898)) {
  func_ov005_021abb00(O);
  total += func_ov015_021b2630(W,rng,dst);
  target = Ov015_UpdateScrollTarget(W);
  if (W->active) F->dirty=1;
  else if (*(int *)((char *)O+0x54)==0) {
   height=func_ov005_021ac9c8(O); /* Original supplies a pointer to this void-parameter callee. */
   if (height>0) {
    rem=(int)(func_020b3870(target,height)>>32);
    if (rem >= (height>>1)) { target+=height; F->dirty=1; target-=rem; }
    else if (rem>0) { target-=rem; F->dirty=1; }
    func_ov015_021b23f4(W,target);
   }
  }
  func_ov005_021abc68(O,0,target);
  if (F->dirty==1) {
   F->dirty=0;
   func_ov005_021abe5c(O);
   func_ov005_021ac91c(O);
  }
  rem=func_ov005_021ab858(O,0x1000,rng,dst);
  total+=*(unsigned short *)((char *)O+0x38);
  if (rem==1) {
   func_ov005_021abc74(O,&x,&y);
   func_ov015_021b23f4(W,y);
   F->dirty=1;
  }
  if (F->selected==1 && !F->dirty) {
   height=func_ov005_021ac984(O);
   for(target=0;target<height;target++) {
    if (*(int *)(s+4)==func_ov005_021ac9d0(O,target)) {
     func_ov015_021b3520(s+0x880,target); break;
    }
   }
   F->selected=0;
  }
  func_ov015_021b3240((struct S575 *)(s+0x880),0,func_ov005_021ab108(*(void **)(s+0x874),1)-1);
  total+=func_ov015_021b3280(s+0x880,0x1000,rng,dst);
 }
 return total;
}



