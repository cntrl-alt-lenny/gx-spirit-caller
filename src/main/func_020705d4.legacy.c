typedef unsigned int u32;
typedef struct {
 unsigned char pad[8];
 unsigned char state;
 unsigned char pad9[0x1f];
 u32 sent;
 unsigned short pending;
 unsigned short pad2e;
 u32 position;
 u32 field34;
} Conn;
extern int func_020707f0(int a, int b, int c, int d, int e, int f);
extern void func_0207445c(void);
extern unsigned long long func_020930b0(void);
extern int (*data_0219ef14)(void);
int func_020705d4(int a, u32 b, int c, int d, Conn *p) {
 int total = 0;
 int delta;
 int idle = 0;
 int last;
 int start;
 p->field34 = 0;
 last = (u32)(func_020930b0() >> 16);
 while (data_0219ef14() && b != 0 && p->state == 4 && (int)((u32)(func_020930b0() >> 16) - last) < 159) {
  u32 oldsent = p->sent;
  func_020707f0(a, b, c, d, (int)p, idle);
  start = (u32)(func_020930b0() >> 16);
  do {
   func_0207445c();
  } while (data_0219ef14() && p->state == 4 && p->sent != p->position && (int)((u32)(func_020930b0() >> 16) - start) < 15 && (!idle || p->pending == 0));
  delta = p->position - oldsent;
  total += delta;
  if (delta != 0) last = (u32)(func_020930b0() >> 16);
  p->sent = p->position;
  if (p->state == 4 && p->pending == 0 && delta == 0) {
   if (idle == 0) {
    start = (u32)(func_020930b0() >> 16);
    while (data_0219ef14() && (int)((u32)(func_020930b0() >> 16) - start) < 15) {
     func_0207445c();
     if (p->pending != 0) break;
    }
    if (p->pending == 0) idle = 1;
   }
  } else idle = 0;
  if (delta < b) { a += delta; b -= delta; }
  else { u32 n = delta - b; a = c + n; b = d - n; c = 0; d = 0; }
 }
 return total;
}




