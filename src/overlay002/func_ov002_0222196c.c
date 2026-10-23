typedef unsigned short u16;
struct Event {
 u16 id;
 u16 player:1; u16 idx:5; u16 rest:10;
 u16 pad:2; u16 active:1; u16 pad2:3; u16 value:9; u16 pad3:1;
};
struct Word { unsigned int id:13; unsigned int half:1; unsigned int pad:8; unsigned int level:8; unsigned int pad2:2; };
extern char data_ov002_022cf16c[];
extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_0222196c(void *self, struct Event *event) {
 event->active = 1;
 func_ov002_021d8904(event->player, event->idx, event->value);
 if (event->idx >= 5 && event->idx <= 10) {
  int player = event->player;
  int idx = event->idx;
  char *row = data_ov002_022cf16c + (player & 1) * 0x868;
  struct Word *w = (struct Word *)(row + 0x30 + idx * 0x14);
  if (w->half + (w->level << 1) == event->value) {
   func_ov002_021d59cc(player, idx, 0x17c2, 3, 0);
  }
 }
 return 0;
}
