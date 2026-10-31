typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; u16 pad:6, index:9, last:1; u16 extra[7]; u32 value; } Card;
struct Entry { u32 id:13, flag:1, pad:8, value:8, rest:2; };
struct Player { char pad[0x120]; struct Entry cards[32]; char tail[0x6c8]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021fc3e8(Card *self, Card *other);
int func_ov002_021fc0c8(int player, int index, Card *other) {
 Card card;
 int *z = (int *)&card;
 struct Entry *p = &data_ov002_022cf16c[player & 1].cards[index];
 z[0]=0; z[1]=0; z[2]=0; z[3]=0; z[4]=0; z[5]=0;
 card.side=(u16)player;
 card.zone=11;
 card.id=p->id;
 card.flip=0;
 card.index=(u16)(p->flag+(p->value<<1));
 return func_ov002_021fc3e8(&card,other);
}


