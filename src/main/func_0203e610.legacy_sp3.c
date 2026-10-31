typedef unsigned long long u64;
typedef struct { unsigned char state:4; unsigned char rest:4; char pad[3]; int value; char pad8[0x1c]; } Slot;
typedef struct {
 char pad0[0x300];
 Slot slots[1];
 char pad324[0x98c];
 u64 time;
 char padcb8[0x57];
 unsigned char index;
 unsigned char count;
 signed char selected;
 char padd12[3];
 unsigned char round;
} Game;
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
extern int func_0203e540(Game *, int);
extern signed char func_0203eaa8(int);
extern void func_0203e3d4(int, int, int, int);
extern char data_020bee6c[];
int func_0203e610(Game *g) {
 if (func_020b3808((func_020930b0() - g->time) << 6, 0x82ea) >= 150 || g->slots[g->index].state == 1) {
  g->slots[g->index].state = 0;
  g->index++;
  if (g->count <= g->index) {
   g->round++;
   g->index = 0;
   g->selected = func_0203eaa8(g->round);
  }
  if (g->selected < 0) {
   g->round = 0;
   return func_0203e540(g, 5);
  }
  g->time = func_020930b0();
  func_0203e3d4((int)(data_020bee6c + 0x10), (int)&g->slots[g->index].value, g->selected, 0x300000);
 }
 return 5;
}

