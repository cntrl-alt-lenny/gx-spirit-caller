typedef struct { unsigned id:13; unsigned rest:19; } Ent;
typedef struct { int pad[3]; unsigned count; char pad2[272]; Ent cards[1]; } Player;
extern char data_ov002_022cf16c[];
typedef struct { unsigned count; char pad[2148]; } Count;
extern Count data_ov002_022cf178[];
extern char data_ov002_022cdc78[];
extern Ent data_ov002_022cdc88[];
extern int func_ov002_021b9ecc(int player, int index);
extern int func_020315e8(int arg0);
extern int func_ov002_0227e914(int a);
extern int func_ov002_0227e76c(int unused0);
extern int func_ov002_0227e784(int target);
int func_ov002_0227e9d4(int player) {
 int owned[9], available[9];
 int special = 0;
 int i, id;
 unsigned j;
 Ent *entry;
 Player *p;
 for (j=0; j<9; j++) { available[j]=0; owned[j]=0; }
 for (i=0; i<=4; i++) {
  id=func_ov002_021b9ecc(player,i);
  special |= func_020315e8(id);
  owned[func_ov002_0227e914(id)]=1;
 }
 j=0;
 if (j < data_ov002_022cf178[player & 1].count) {
  p=(Player *)(data_ov002_022cf16c + (player&1)*0x868);
  entry=p->cards;
  do {
   id=entry->id;
   special += func_020315e8(id);
   owned[func_ov002_0227e914(id)]=1;
   j++;
   entry++;
  } while (j<p->count);
 }
 for(j=0; j<*(unsigned *)(data_ov002_022cdc78+0xc); j++) {
  if(func_ov002_0227e76c(j)==0) available[func_ov002_0227e914(data_ov002_022cdc88[j].id)]=1;
 }
 if(special && available[4]) return func_ov002_0227e784(0x18a9);
 if(special+owned[7] && available[6]) return func_ov002_0227e784(0x194d);
 if(special+owned[6] && available[7]) return func_ov002_0227e784(0x194e);
 if(special+owned[1]+owned[5]>=2 && available[4]) return func_ov002_0227e784(0x18a9);
 if(special+owned[4]+owned[5]>=2 && available[1]) return func_ov002_0227e784(0x18a6);
 if(special+owned[1]+owned[4]>=2 && available[5]) return func_ov002_0227e784(0x18f9);
 if(special+owned[2] && available[1]) return func_ov002_0227e784(0x18a6);
 if(special+owned[1] && available[2]) return func_ov002_0227e784(0x18a7);
 if(special+owned[3] && available[4]) return func_ov002_0227e784(0x18a9);
 if(special+owned[4] && available[3]) return func_ov002_0227e784(0x18a8);
 return -1;
}



