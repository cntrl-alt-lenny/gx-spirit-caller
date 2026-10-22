typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card { u16 id; u16 side:1; u16 slot:5; u16 pad1:6; u16 mode:2; u16 pad2:2; u16 indexbits; u16 f6; u32 rest[4]; } Card;
struct Self { u16 id; u16 side:1; u16 rest:15; char pad[8]; u16 kind; };
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 high:2; char rest[16]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021ed604(struct Self *, int, int);
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021e8a18(void *, int, int);
extern int func_0202e340(int);
extern int func_ov002_021c1ef0(Card *, int, int);
extern int func_ov002_021b34f4(int, int, int, int);
extern u16 func_ov002_0223de94(struct node *, int);
int func_ov002_021ef090(struct Self *self, int player, int idx) {
 switch(self->kind) {
 case 1:
  if(func_ov002_021ed604(self,player,idx)!=0) {
   Card card = {0};
   int i;
   struct Slot *p;
   card.side=(u16)player;
   card.slot=(u16)idx;
   card.mode=3;
   card.id=func_ov002_021b9ecc(player,idx);
   p=&((struct Slot *)(data_ov002_022cf16c+(player&1)*0x868+0x30))[idx];
   card.indexbits=(card.indexbits & 0xffff803f) | ((u32)(u16)(p->flag+(p->value<<1)) <<23 >>17);
   for(i=0;i<=4;i++) {
    if(i!=idx && func_ov002_021e8a18(&card,player,i)!=0) return 1;
   }
  }
  break;
 case 2: {
  int id;
  int j,i;
  if(self->side!=player) return 0;
  if(idx<5 || idx>=10) return 0;
  id=((struct Slot *)(data_ov002_022cf16c+(player&1)*0x868+idx*20+0x30))->id;
  if(id==0) return 0;
  if(func_0202e340(id)==0) return 0;
  if(func_ov002_021c1ef0((Card *)self,player,idx)==0) return 0;
  for(i=0;i<2;i++) {
   for(j=0;j<=4;j++) {
    int kind=func_ov002_021b34f4(i,j,player,idx);
    switch(kind) { case 10: case 11: return 1; }
   }
  }
  break;
 }
 case 3: {
  int pair=func_ov002_0223de94((struct node *)self,0);
  int side=(unsigned char)pair;
  int slot=(unsigned char)((u16)pair>>8);
  if(player==side && idx!=slot) {
   if(((struct Slot *)(data_ov002_022cf16c+(player&1)*0x868+idx*20+0x30))->id!=0) {
    Card card={0};
    struct Slot *p;
    card.side=(u16)side;
    card.slot=(u16)slot;
    card.mode=3;
    card.id=func_ov002_021b9ecc(side,slot);
    p=&((struct Slot *)(data_ov002_022cf16c+(side&1)*0x868+0x30))[slot];
    card.indexbits=(card.indexbits & 0xffff803f) | ((u32)(u16)(p->flag+(p->value<<1)) <<23 >>17);
    return func_ov002_021e8a18(&card,player,idx);
   }
  }
  break;
 }
 }
 return 0;
}



