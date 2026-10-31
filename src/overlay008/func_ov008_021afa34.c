typedef unsigned short u16;
typedef struct {
 void *task; int pad04[2]; int y; int pad10;
 unsigned short mode:4; unsigned short enabled:1; unsigned short rest:11;
 unsigned short pad16;
 unsigned int low:14; unsigned int priority:3; unsigned int high:15;
 unsigned int a:8; unsigned int b:8; unsigned int spare:16;
 int tail[2];
} Obj;
typedef struct {
 u16 first; char pad2[4]; u16 mode; char pad8[0xa0];
 u16 limit; u16 timer; char padac[8]; int done; int active; int padbc; u16 *cards; u16 count;
} State;
extern State data_ov008_021b2de4;
extern signed char data_ov008_021b2dec[][32];
extern const signed char data_ov008_021b26dc[];
extern void func_ov008_021af71c(u16 *out, int arg);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_0202be4c(int);
extern void Task_Invoke(void *p);
extern int func_0202227c(int idx, int b);
extern int OS_SPrintf(signed char *buffer, const signed char *format, ...);
void func_ov008_021afa34(int index) {
 Obj obj;
 u16 *cards = data_ov008_021b2de4.cards + index * 5;
 int i;
 func_ov008_021af71c(cards, index);
 for (i = 0; i < 5; i++) {
  if (data_ov008_021b2de4.active == 0) {
   OS_SPrintf(data_ov008_021b2dec[i], data_ov008_021b26dc, cards[i]);
   func_0202227c(i + 2, (int)data_ov008_021b2dec[i]);
   data_ov008_021b2de4.timer = 0x1db;
   if (data_ov008_021b2de4.mode == 1) data_ov008_021b2de4.timer -= 0x3c;
  }
  if (index >= data_ov008_021b2de4.first - 1 && index < data_ov008_021b2de4.first + 4) {
   func_0201d47c(&obj);
   obj.task = func_0202be4c(cards[i]);
   obj.mode = 9;
   obj.y = (((index % 5) * 5 + i) * 8 + 0x2f3) << 7;
   obj.enabled = 1;
   obj.priority = 7;
   func_0201e5b8(&obj);
   Task_Invoke(obj.task);
  }
 }
 data_ov008_021b2de4.count++;
 if (data_ov008_021b2de4.count == data_ov008_021b2de4.limit) data_ov008_021b2de4.done = 1;
}
