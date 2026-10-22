typedef unsigned char u8;
typedef unsigned long long u64;
typedef struct {
 u8 active, participant, stage, pad;
 unsigned int delay;
 int mask, complete;
 u64 start, tick;
} Timer;
extern Timer *data_0219dc84;
extern void *func_020498f0(void);
extern void func_020498dc(int);
extern void func_0204b034(int);
extern int func_0204b0d0(int);
extern void func_0204bd8c(void);
extern void func_0204bf44(int);
extern void func_0204c40c(int);
extern void *func_0204ce3c(int);
extern void func_0204cf7c(int,int,int);
/* The original consumes r0 from this dispatcher, despite its C definition returning void. */
extern int func_0204d438(int);
extern int func_0204ead0(unsigned char, void *, int, int, const int *, int);
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64,u64);
typedef struct { char pad0[0xd]; u8 count; char pad1[7]; u8 mode, selected; char pad2[13]; int words[32]; unsigned short halves[34]; int state; u64 clock; void *objects[43]; int phase; u8 index; char pad3[0x12b]; u8 shifts[1]; } Context;
#define C() ((Context *)func_020498f0())
#define B(p,o) (*(u8 *)((char *)(p)+(o)))
#define I(p,o) (*(int *)((char *)(p)+(o)))
#define P(p,o) (*(void **)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
#define Q(p,o) (*(u64 *)((char *)(p)+(o)))
void func_0204abfc(void) {
 Timer *t;
 void *p;
 int mask;
 unsigned int stage;
 int i;
 if (data_0219dc84 == 0) return;
 if (data_0219dc84->active == 0) return;
 if (B(func_020498f0(),0x15) == 2) return;
 if (B(func_020498f0(),0x15) == 3) return;
 if (I(func_020498f0(),0x1a0) == 0x13) {
  mask = func_0204b0d0(0);
  t = data_0219dc84;
  if (t->mask == mask) {
   if (t->complete == mask) {
    p = func_020498f0(); B(p,0x16) = B(func_020498f0(),0xd);
    p = func_020498f0(); B(p,0x1a4) = B(func_020498f0(),0xd)-1;
    func_0204c40c(0); return;
   }
   t->tick = func_020930b0(); t->mask = 0;
   if (B(func_020498f0(),0x15) == 0) {
    func_020498dc(3); I(func_020498f0(),0xe8)=2;
    p=func_020498f0(); Q(p,0xec)=func_020930b0(); return;
   }
   func_020498dc(4); func_0204cf7c(1,0,0); return;
  }
  stage=t->stage;
  if (func_020b3808((func_020930b0()-t->tick)<<6,0x82ea) < (u64)(int)(stage*6000)) return;
  if (stage>5) {
   func_0204b034(1); func_0204bd8c(); func_0204bf44(1); return;
  }
  for (i=1;i<=B(func_020498f0(),0xd);i++) {
   if (!(data_0219dc84->mask & (1<<C()->shifts[i]))) {
    void *a=func_020498f0();
    void *b=func_020498f0();
    int r=func_0204ead0(17,((Context *)a)->objects[i],((Context *)b)->words[i],C()->halves[i],0,0);
    if (func_0204d438(r)) return;
   }
  }
  data_0219dc84->stage++; return;
 }
 if (I(func_020498f0(),0x1a0) != 4 && I(func_020498f0(),0x1a0) != 3) return;
 t=data_0219dc84;
 if (B(func_020498f0(),0xd)<t->participant-1) return;
 if (t->stage == 0 && (t=*(Timer * volatile *)&data_0219dc84, func_020b3808((func_020930b0()-t->start)<<6,0x82ea) >= t->delay)) {
 } else {
  if (t->stage==0) return;
  t=data_0219dc84;
  if (func_020b3808((func_020930b0()-t->tick)<<6,0x82ea)<(t->delay>>2)) return;
 }
 if (I(func_020498f0(),0x204)!=0) {
  if (func_0204d438((int)func_0204ce3c(I(func_020498f0(),0x204)))) return;
 }
 func_020498dc(19);
 for(i=1;i<=B(func_020498f0(),0xd);i++) {
  void *a=func_020498f0();
  void *b=func_020498f0();
  int r=func_0204ead0(17,((Context *)a)->objects[i],((Context *)b)->words[i],C()->halves[i],0,0);
  if (func_0204d438(r)) return;
 }
 t=data_0219dc84; t->tick=func_020930b0(); t->stage=1;
}


