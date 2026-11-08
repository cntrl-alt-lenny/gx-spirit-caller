typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int f0,f4,f8,fc,f10,f14,state,value; } Obj;
struct S { int f0, f4, f8; char _pad[0xc]; int f18; };
typedef struct Menu {
 int active, mode; u32 bits; int mask,f10,selection,invalid,cancel,index,count;
 int scroll,f2c,row,f34; int fade; int f3c,f40,closing,f48,total;
 int pad50[4],changed,pad64; int *entries; int pad6c; void *task;
 char pad74[0x20]; u16 ids[1]; char pad96[0xfe]; int options; Obj buttons[3];
} Menu;
typedef struct { char pad[4]; int f4; char pad8[0x2c]; int f34; } ObjA16;
typedef struct { char pad[0x68]; int *f_68; } state_ov002_022ac028_t;
struct S022abf88 { int f0,f4,f8,fc; char pad10[0x10]; int f20; char pad24[0x28]; int f4c; char pad50[0x18]; void **f68; };
extern struct { char pad[0xd0]; int state, busy; } data_ov002_022d0f2c;
extern struct { char pad[0xd44]; int value; } data_ov002_022d016c;
extern void Task_InvokeLocked(void *p);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern long long func_020b3870(int numerator,int denominator);
extern int func_ov002_021afaf0(void);
extern void *func_ov002_021afbc4(void);
extern void func_ov002_021aff4c(int index,int value);
extern void func_ov002_021aff90(int arg0);
extern void *func_ov002_022477d8(void);
extern unsigned short func_ov002_0226b3f0(void);
extern void func_ov002_0229f3b4(struct S *self);
extern void func_ov002_0229f788(void *self);
extern void func_ov002_0229f9a4(Menu *self,int mode,int arg2,u32 bits);
typedef struct { int f0,mode; u32 bits,mask; int f10,kind,pad18[2],index,pad24[3],count; char pad34[0x184]; int f1b8; char pad1bc[0x14]; int f1d0; int pad1d4; int f1d8; char pad1dc[0x14]; int f1f0; char pad1f4[0x40]; int f234; } Self;
extern void func_ov002_022a10fc(Self *self,int i);
extern int func_ov002_022a16fc(ObjA16 *s);
extern int func_ov002_022a1784(ObjA16 *s);
extern int func_ov002_022a1870(int *p);
extern void func_ov002_022a19a8(Menu *s);
extern void func_ov002_022a1e60(Menu *self);
extern void func_ov002_022a28a0(struct S022abf88 *self);
extern int func_ov002_022ac028(state_ov002_022ac028_t *p,int idx);
extern void func_ov002_022b0444(int n);
extern void func_ov002_022b2048(Menu *s);
typedef struct { u32 low:8,planes:5,display:3,high:16; char pad[0x46]; u16 blend; } Hardware;
static inline int ready(Obj *p) { return p->f0 && p->state; }
static inline int waiting(Obj *p) { if(p->f0 && p->state) { if(p->state<16) return 1; } return 0; }
static inline int canfade(Menu *s) { if(s->mode==11) return s->fade<12; return s->fade<16; }
static inline int busy(void) { return data_ov002_022d0f2c.busy>0; }
void func_ov002_022a215c(Menu *s) {
 int i; int j; Obj *button;
 if(!s->active) return;
 s->invalid=0;
 if(s->closing && !s->fade) {
  u32 planes=(*(volatile u32 *)0x04001000 & 0x1f00)>>8;
  *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00) | ((planes & ~12)<<8);
  ((volatile Hardware *)0x04001000)->blend = (((volatile Hardware *)0x04001000)->blend & ~0x3f) | 0x3f;
  { u32 display=(*(volatile u32 *)0x04001000 & 0xe000)>>13;
  *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0xe000) | ((display & ~2)<<13); }
  data_ov002_022d0f2c.state=0; s->active=0;
  if(s->task) { Task_InvokeLocked(s->task); s->task=0; }
  if(s->entries) { Task_InvokeLocked(s->entries); s->entries=0; }
  if(s->mode==13) { func_ov002_0229f9a4(s,32,0,s->bits); return; }
  if(s->mode==11) for(i=0;i<s->count;i++) func_ov002_022b0444(s->ids[i]-4);
  return;
 }
 j=0; if(s->options>0) { button=s->buttons; do { func_ov002_0229f3b4((struct S *)button); j++; button++; } while(j<s->options); }
 if(s->closing) s->fade-=s->fade>0;
 else if(func_ov002_022a1784((ObjA16 *)s)) {
  if(s->mode==11) s->fade += s->fade<12; else s->fade += s->fade<16;
  if(func_ov002_022a1870((int *)s)) data_ov002_022d0f2c.state=2;
 } else { s->fade-=s->fade>4; data_ov002_022d0f2c.state=0; }
 switch(s->mode) {
 case 12: if(!func_ov002_0226b3f0()) func_ov002_0229f788(s); return;
 case 32: if(!func_ov002_022477d8()) func_ov002_0229f788(s); return;
 }
 switch(busy()) { case 0: {
  if(func_ov002_022a16fc((ObjA16 *)s) && (func_02006194() || func_0200617c())) {
   data_ov002_022d0f2c.state=2; func_ov002_022a19a8(s);
  } else if(data_ov002_022d0f2c.state==2) func_ov002_022a1e60(s);
 }
 }
 switch(s->mode) {
 case 11: func_ov002_022b2048(s);
 case 0: case 1: case 2: case 4: case 7: case 8: case 13:
  for(i=0;i<s->options;i++) if(ready(&s->buttons[i])) {
   if(waiting(&s->buttons[i])) return;
   data_ov002_022d016c.value=s->buttons[i].value; func_ov002_0229f788(s); return;
  }
  break;
 case 3: case 5: case 6: case 9:
  for(i=0;i<s->options;i++) if(ready(&s->buttons[i])) {
   if(waiting(&s->buttons[i])) return;
   switch(i) {
   case 0: s->index=(int)(func_020b3870(s->index+s->count-1,s->count)>>32); func_ov002_022a10fc((Self *)s,s->index); break;
   case 1: func_ov002_022a28a0((struct S022abf88 *)s); break;
   case 2: s->index=(int)(func_020b3870(s->index+1,s->count)>>32); func_ov002_022a10fc((Self *)s,s->index); break;
   } return;
  } break;
 case 10:
  for(i=0;i<s->options;i++) if(ready(&s->buttons[i])) {
   if(waiting(&s->buttons[i])) return;
   switch(i) {
   case 0:
    s->index-=(unsigned char)(((u16)(s->bits>>16)&0xf0)>>4);
    s->index=s->index>(int)((u16)(s->bits>>16)&15) ? s->index : ((u16)(s->bits>>16)&15);
    func_ov002_022a10fc((Self *)s,s->index); break;
   case 1: func_ov002_022a28a0((struct S022abf88 *)s); break;
   case 2:
    { int value=s->index+(unsigned char)(((u16)(s->bits>>16)&0xf0)>>4); int limit; s->index=value; limit=(unsigned char)((u16)(s->bits>>16)>>8); s->index=value>limit ? limit : value; }
    func_ov002_022a10fc((Self *)s,s->index); break;
   } return;
  } break;
 }
 if(s->mode<0) for(i=0;i<s->options;i++) if(ready(&s->buttons[i])) {
  if(waiting(&s->buttons[i])) return;
  switch(i) {
  case 0: func_ov002_022a28a0((struct S022abf88 *)s); break;
  case 1: case 2: {
   int value=func_ov002_022ac028((state_ov002_022ac028_t *)s,s->index);
   s->changed=0;
   if(value) { func_ov002_021aff90(value); s->total--; }
   else if(s->total<func_ov002_021afaf0()) {
    int next;
    int entry=s->entries[s->index]; s->total++; func_ov002_021aff4c(entry,s->total);
    if(s->total==func_ov002_021afaf0()) { s->selection=0; s->changed=1; }
    else {
     next=s->index+1;
     if(next<(int)func_ov002_021afbc4() && !func_ov002_022ac028((state_ov002_022ac028_t *)s,next)) s->index++;
    }
   }
   func_ov002_022a10fc((Self *)s,s->index); break;
  }
  } return;
 }
}
