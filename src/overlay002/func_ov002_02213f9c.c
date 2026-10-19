struct Input {
 unsigned short card;
 unsigned short player:1;
 unsigned short row:5;
 unsigned short pad2:10;
 unsigned short pad4:6;
 unsigned short id:9;
 unsigned short pad5:1;
};
struct Slot {
 unsigned int pad0:13;
 unsigned int low:1;
 unsigned int pad1:8;
 unsigned int high:8;
 unsigned int pad2:2;
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(void *self, int flag, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_02213f9c(struct Input *p) {
 int out;
 int a = (p->player & 1) * 0x868;
 int b = p->row * 20;
 struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + a + 0x30 + b);
 if (p->id != slot->high * 2 + slot->low) return 0;
 if (*(unsigned short *)(data_ov002_022cf1a4 + a + b) == 0) return 0;
 if (func_ov002_0223df38(p, 0, &out)) {
  int hi = (int)(unsigned short)out >> 8;
  int player = out & 0xff;
  int row = hi & 0xff;
  if (func_ov002_0225764c((int)p, player, row)) {
   func_ov002_021d59cc(player, row, (unsigned short)((unsigned char)p->player | ((unsigned char)p->row << 8)), 0x106, 0);
  }
 }
 return 0;
}
