#include "ov002_core.h"
struct Self {
 unsigned short f0;
 unsigned short side:1, row:5, pad2:10;
 unsigned short pad4:2, disabled:1, pad5:3, value:9, pad6:1;
};
struct Entry {
 unsigned int id:13, low:1, pad:8, high:8, rest:2;
 unsigned short x4, x6, x8;
 char tail[10];
};
struct Row { char pad[0x30]; struct Entry entry; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c8940();
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
int func_ov002_02211f88(struct Self *self) {
 int player, idx;
 struct Row *row;
 struct Entry *entry;
 if (self->disabled) return 0;
 entry = (struct Entry *)(data_ov002_022cf16c + (self->side & 1)*0x868 + 0x30);
 if (self->value != entry[self->row].high*2 + entry[self->row].low) return 0;
 for (player=0;player<2;player++) {
  row = (struct Row *)(data_ov002_022cf16c + (player & 1)*0x868);
  entry = &row->entry;
  for (idx=0;idx<5;idx++,row = (struct Row *)((char *)row + 0x14),entry++) {
   if (row->entry.x8 != 0 && row->entry.x6 == 0 && entry->id != 0 && func_ov002_021c8940(player,idx) == 1)
    func_ov002_021d6808((struct Ov002Self *)self,player,idx,0,0);
  }
 }
 return 0;
}



