typedef struct { unsigned low:12, value:4, middle:8, high:8; } Selection;
typedef union { unsigned raw; struct { unsigned low:9, mode:2, bit11:1, confirm:1, mid:8, index:2, high:9; } bits; } Flags;
typedef struct OvTask_021ac72c { unsigned int flags,unk04,unk08,unk0c; void (*callback)(struct OvTask_021ac72c *); } OvTask_021ac72c;
typedef struct { char pad[0x2a8]; Selection selection; } Initial;
typedef struct { char pad[0x78]; char widget[0xdc]; OvTask_021ac72c tasks[1]; char pad2[0xec]; void *a,*b; char pad3[0x10]; Flags flags; Selection selection; struct { unsigned low:14, mask:8, high:10; } display; } State;
extern Initial data_ov000_021c758c;
extern State data_ov000_021c75c4;
extern void Task_InvokeLocked(void *p);
extern void func_ov000_021ab4bc(int idx,int val);
extern void func_ov000_021ab4ec(int idx,int val);
extern void func_ov000_021ab5d8(int idx,int a,int b);
extern void func_ov000_021ab62c(int idx,int a,int b);
extern void func_ov000_021ab688(int idx,int a,int b);
extern void func_ov000_021ab8f8(void);
extern void func_ov000_021ac578(OvTask_021ac72c *p);
extern void func_ov000_021ac72c(OvTask_021ac72c *t);
extern void func_ov000_021ac810(int v);
extern int func_ov000_021ac834(void);
extern int func_ov000_021adb58(int arg);
extern void func_ov000_021adfc4(void *,void *);
extern void func_ov000_021ae510(int);
extern void func_ov000_021ae69c(void);
extern void func_ov000_021b3544_unk(void *);
void func_ov000_021ae95c(void) {
 State *s=&data_ov000_021c75c4;
 int v;
 if(data_ov000_021c758c.selection.high>=3 && s->selection.high<=5) {
  if(s->flags.bits.mode==1) {
   int i; OvTask_021ac72c *p=s->tasks;
   i=0; do { func_ov000_021ac578(p); func_ov000_021ac72c(p); i++; p++; } while(i<1U);
  }
  func_ov000_021ae510(s->selection.value);
  func_ov000_021b3544_unk(s->widget);
 }
 switch(s->selection.high) {
 case 0: break;
 case 1: func_ov000_021ac810(0); s->selection.high++; break;
 case 2:
  if(func_ov000_021ac834()!=0) return;
  func_ov000_021ab4bc(0,s->display.mask);
  func_ov000_021ab62c(0,63,63);
  func_ov000_021ab5d8(0,s->display.mask,(~s->display.mask & 15)|16);
  func_ov000_021ab688(0,0,16);
  func_ov000_021ab8f8();
  func_ov000_021adb58(s->flags.bits.index);
  func_ov000_021adfc4(s->a,s->b);
  s->flags.raw |= 0x800;
  if(s->a) Task_InvokeLocked(s->a);
  if(s->b) Task_InvokeLocked(s->b);
  s->b=0; s->a=0; s->selection.high++;
  break;
 case 3:
  v=s->selection.middle+24;
  if(v>255) { s->selection.high++; v=255; }
  func_ov000_021ab688(0,v*12/255,16-v*12/255);
  *(volatile unsigned *)0x04000018=0;
  if(s->display.mask & 1) *(volatile unsigned *)0x04000010=0;
  else *(volatile unsigned *)0x0400001c=0;
  s->selection.middle=(unsigned char)v;
  break;
 case 4: func_ov000_021ae69c(); break;
 case 5:
  v=s->selection.middle-8;
  if(v<=0) {
   v=255;
   func_ov000_021ab62c(0,31,31);
   func_ov000_021ab5d8(0,s->display.mask,(~s->display.mask & 15)|16);
   s->selection.high++;
  }
  s->selection.middle=v;
  break;
 case 6:
  v=s->selection.middle-24;
  if(v<0) { v=0; func_ov000_021ab4ec(0,s->display.mask); s->selection.high++; }
  else func_ov000_021ab688(0,v*12/255,16-v*12/255);
  s->selection.middle=(unsigned char)v;
  break;
 case 7:
  if(func_ov000_021ac834()!=0) return;
  s->selection.high++;
  break;
 }
}



