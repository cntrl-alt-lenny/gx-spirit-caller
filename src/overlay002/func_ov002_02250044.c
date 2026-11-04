typedef unsigned short u16;
typedef unsigned int u32;
struct Card { unsigned id:13; unsigned lo:1; unsigned mid:8; unsigned hi:8; unsigned rest:2; };
struct Entry { unsigned id:13; unsigned rest:19; u16 f4; u16 f6; u16 f8; char pad[10]; };
struct Player {
 char pad0[0x14];
 u32 count;
 char pad1[0x18];
 struct Entry cards[5];
 char gap[0x418 - 0x30 - 0x64];
 struct Card hand[1];
 char tail[0x868 - 0x41c];
};
struct Msg {
 u16 id;
 u16 owner:1; u16 slot:5; u16 r1:6; u16 mode:2; u16 r:2;
 u16 a:6; u16 b:9; u16 c:1;
 u16 pad;
 u32 more[4];
};
extern struct Player data_ov002_022cf16c[];
extern u32 func_0202b8c0(int id);
extern int func_ov002_021c8940();
extern int func_ov002_021e797c(void *self, int player, int idx);
extern void func_ov002_02253458(int a, int b, int c);
void func_ov002_02250044(int player) {
 int flags[5];
 struct Msg m = {0};
 int i;
 int any = 0;
 int j;
 struct Player *pl;
 m.owner = player;
 m.slot = 11;
 m.mode = 0;
 pl = &data_ov002_022cf16c[player & 1];
 for (i = 0; i <= 4; i++) {
  if (pl->cards[i].id && pl->cards[i].f8 && func_ov002_021c8940(player, i) == 0xf) {
   any = 1;
   flags[i] = 1;
  } else {
   flags[i] = 0;
  }
 }
 if (!any) return;
 for (i = 0; i < data_ov002_022cf16c[player & 1].count; i++) {
  struct Card *c = &pl->hand[i];
  int id = c->id;
  if (func_0202b8c0(id) == 3) {
   m.id = id;
   m.b = c->hi * 2 + c->lo;
   for (j = 0; j <= 4; j++) {
    if (flags[j] && func_ov002_021e797c(&m, player, j) == 1) {
     func_ov002_02253458(player, 0xe, i);
     break;
    }
   }
  }
 }
}
