#include "ov002_core.h"
typedef struct Card {
 u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1;
 u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15;
} Card;
extern int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern int func_ov002_021e05fc(int side, int amount);
extern int func_ov002_021b9000(int player, int idx);
extern int func_ov002_021eace4(void *self, int player, int idx);
extern int func_ov002_02257878();
struct Id { unsigned int id:13; unsigned int rest:19; };
int func_ov002_02218e7c(struct Ov002Self *self) {
 int i, player, j, count;
 struct Id *id;
 char *base;
 count = func_ov002_02257878((int)self, (int)func_ov002_021eace4);
 for (i=0; i<2; i++) {
  player = *(int *)(data_ov002_022d016c+0xcec) ^ i;
  base = data_ov002_022cf16c + (player & 1)*0x868;
  id = (struct Id *)(base+0x30);
  for (j=0; j<5; j++) {
   if (id->id && *(u16 *)(base+0x38)==0 && *(u16 *)(base+0x36)!=0) {
    func_ov002_021d63fc(self,player,j,2);
    if (func_ov002_021b9000(player,j)) count++;
   }
   id=(struct Id *)((char *)id+0x14);
   base+=0x14;
  }
 }
 switch (self->f0) {
 case 0x135c: func_ov002_021df818((Card *)self,1-self->b0,count*500); break;
 case 0x1635: func_ov002_021e05fc(self->b0,count*400); break;
 }
 return 0;
}


