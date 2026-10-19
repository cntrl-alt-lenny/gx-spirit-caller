typedef unsigned long long u64;
typedef struct { unsigned char a,b,c; unsigned char low:7; unsigned char done:1; } Flag;
typedef struct {
 char pad0[0x444];
 Flag flags[1];
 char pad448[0x868];
 u64 time;
 char padcb8[0x57];
 unsigned char index;
 char padd10[2];
 unsigned char count;
} Game;
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
extern int func_0203e540(Game *, int);
extern void func_0203e3d4(int, int, int, int);
int func_0203e730(Game *g) {
 if (func_020b3808((func_020930b0() - g->time) << 6, 0x82ea) >= 150 || g->flags[g->index].done == 1) {
  g->flags[g->index].done = 1;
  while (g->index < g->count) {
   if (!g->flags[g->index].done) break;
   g->index++;
  }
  if (g->count <= g->index) {
   g->index = 0;
   return func_0203e540(g, 4);
  }
  g->time = func_020930b0();
  func_0203e3d4((int)((char *)g + 0x474 + g->index * 0xc0), (int)((char *)g + 0x47c + g->index * 0xc0), *(unsigned short *)((char *)g + 0x4a6 + g->index * 0xc0) - 1, 0x300000);
 }
 return 4;
}

