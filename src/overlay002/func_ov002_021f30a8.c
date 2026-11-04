typedef unsigned short u16;
struct node {
 u16 kind;
 u16 owner:1; u16 slot:5; u16 category:6; u16 mode:4;
 u16 pad4:6; u16 val:9; u16 rest:1;
};
struct Entry { unsigned id:13; unsigned a:1; unsigned b:8; unsigned c:8; unsigned d:2; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern struct Player data_ov002_022cf16c[];
static inline struct Entry *getEntry(int player, int idx) {
 return &data_ov002_022cf16c[player & 1].cards[idx];
}
int func_ov002_021f30a8(struct node *self, int player, int idx) {
 if (getEntry(player, idx)->id == 0) return 0;
 if (idx >= 10) return 0;
 if (getEntry(player, idx)->c * 2 + getEntry(player, idx)->a == self->val) return 0;
 if (player == self->owner) {
  return idx % 5 == self->slot % 5;
 }
 return idx % 5 == 4 - self->slot % 5;
}
