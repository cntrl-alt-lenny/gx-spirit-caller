typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { char pad[0x5c]; unsigned f_5c; char pad1[8]; unsigned f_68; char pad2[4]; unsigned f_70; } state_ov010_021b3998_t;
typedef struct { char pad[0xb0]; int result; char pad1[0xe4]; int active; } Context;
typedef struct { int key; char pad[0x28]; void *scroll; char pad30[0x4c]; state_hw_t *layout; int *obj; char selection[0x5c]; int index; char pade4[0x13c]; union { unsigned flags; struct { unsigned dirty:1, rest:31; } bits; }; } State;
typedef struct { char pad[0x54]; unsigned short pressed, held; } Input;
extern Context data_ov010_021b91b4;
extern State data_ov010_021b9260;
extern Input data_02104bac;
extern int func_02037208(int a0,int r1,int r2,int r3);
extern int func_ov005_021ab108(void *,int);
extern int func_ov005_021ab260(void *obj,int idx);
extern int func_ov005_021ab318(void *obj,int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p,int idx,unsigned int mask);
extern int func_ov005_021ac984(void *o);
/* The original caller also passes its object to this constant-return helper. */
extern int func_ov005_021ac9c8(void *obj);
extern int func_ov005_021ac9d0(void *obj,int idx);
extern int func_ov005_021ac9dc(void *o,int key);
extern void func_ov005_021aca30(int *o,int v);
extern void func_ov005_021aca64(void *o,int target);
extern void func_ov010_021b23f4(void *arg0,int arg1);
extern int func_ov010_021b3998(state_ov010_021b3998_t *p);
extern int func_ov010_021b39c0(void *arg0);
extern void func_ov010_021b3a14(void *p,int v);
extern int func_ov010_021b4090(int arg0,int arg1);
int func_ov010_021b4ae0(void) {
 State *s=&data_ov010_021b9260;
 int result=data_ov010_021b91b4.result;
 int key,index,next,n,i;
 if(data_ov010_021b91b4.active==1 && s->obj[21]==0) {
  index=s->index;
  key=func_ov005_021ac9d0(s->obj,index);
  if(data_02104bac.pressed&2) s->flags|=4;
  else if(data_02104bac.pressed&1) s->flags|=0x10;
  else if((data_02104bac.held&0x40) && index>=0) {
   if(!func_ov010_021b3998((state_ov010_021b3998_t *)s->selection)) func_ov005_021aca30(s->obj,0x8000);
  } else if((data_02104bac.held&0x80) && index<func_ov005_021ab108(s->layout,4)-1) {
   if(!func_ov010_021b39c0(s->selection)) func_ov005_021aca64(s->obj,0x8000);
  } else if(data_02104bac.held&0x10) {
   if(func_ov005_021ab260(s->layout,key)>0) {
    if(!func_ov005_021ab384(s->layout,key,2)) func_ov010_021b4090(index,-1);
    else if(index==func_ov005_021ac984(s->obj)-1) func_ov005_021aca64(s->obj,0x8000);
    else func_ov010_021b39c0(s->selection);
   }
  } else if(data_02104bac.held&0x20) {
   if(func_ov005_021ab260(s->layout,key)>0 && func_ov005_021ab384(s->layout,key,2)) func_ov010_021b4090(index,-1);
   else {
    next=func_ov005_021ab318(s->layout,key);
    n=func_ov005_021ac984(s->obj);
    if(next!=0) {
     for(i=0;i<n;i++) {
      if(next==func_ov005_021ac9d0(s->obj,i)) { func_ov010_021b3a14(s->selection,i); break; }
     }
     if(i==n) {
      s->key=next;
      next=func_ov005_021ac9dc(s->obj,next);
      func_ov010_021b23f4(s->scroll,next*func_ov005_021ac9c8(s->obj));
      s->bits.dirty=1;
      func_ov010_021b3a14(s->selection,0);
     }
     func_02037208(0x38,-1,0,1);
    }
   }
  }
 }
 return result;
}





