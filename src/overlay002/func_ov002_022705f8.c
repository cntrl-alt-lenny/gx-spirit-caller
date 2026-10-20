struct State { unsigned int player:1; unsigned int pad:7; unsigned int card:15; unsigned int rest:9; };
struct Node { unsigned short pair; unsigned short type:4; unsigned short rest:12; unsigned short pad; unsigned short next; };
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[12]; unsigned int flags; };
extern struct State data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern struct Node data_ov002_022d0650[];
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021b9bd4(int player, int idx);
int func_ov002_022705f8(int player, int a, int b) {
 int sum = a + b;
 unsigned short link;
 int limit = 0;
 if (sum > 4) return 0;
 if (func_ov002_021bc8c8(data_ov002_022cd300.player, player, sum) == 0) return 0;
 if (func_ov002_021b9ecc(player, sum) != 0x10bc) return 0;
 if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
  if (data_ov002_022cd300.player != player) return 0;
  if (func_ov002_021bc288(player, sum) == 0) return 0;
 }
 switch (data_ov002_022cd300.card) {
 case 0xfde: limit = 2; break;
 case 0xfdf: limit = 4; break;
 case 0xfe9: limit = 6; break;
 }
 link = *(unsigned short *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + sum * 20);
 while (link != 0) {
  struct Node *node = &data_ov002_022d0650[link];
  int type = node->type;
  link = node->next;
  if (type == 10) {
   int pair = node->pair;
   int p = (unsigned char)pair;
   int idx = (unsigned char)(pair >> 8);
   struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (p & 1) * 0x868 + idx * 20 + 0x30);
   if (slot->id == 0xfee && ((slot->flags >> 6) & 1) == 0) {
    if (func_ov002_021b9bd4(p, idx) >= limit) return 0x800;
   }
  }
 }
 return 0;
}

