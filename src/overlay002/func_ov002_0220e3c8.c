typedef unsigned short u16;
struct Node { u16 id; u16 owner:1; u16 rest:15; };
struct Entry { char pad[8]; u16 value; char tail[10]; };
struct Player { char pad[48]; struct Entry entries[5]; char tail[2004]; };
struct State { int side; int player; int mode; char pad[20]; int slot; };
struct List { char pad[0x5d4]; unsigned count; char pad2[4]; unsigned char types[32]; int active[32]; };
extern struct State data_ov002_022cd3f4;
extern struct List data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021c2e34(int player, int arg1);
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202f4cc(int x);
extern int func_0202f500(int x);
int func_ov002_0220e3c8(struct Node *self) {
 unsigned i;
 if (func_ov002_021c2e34(self->owner,self->id)<0) return 0;
 if (func_ov002_021ca698(self->owner,self->owner)==0) return 0;
 for (i=0; i<data_ov002_022ce288.count; i++) {
  if (data_ov002_022ce288.types[i]==0x12 && data_ov002_022ce288.active[i]!=0 &&
      data_ov002_022cd3f4.side==1-self->owner && data_ov002_022cd3f4.mode==0 &&
      data_ov002_022cf16c[data_ov002_022cd3f4.player & 1].entries[data_ov002_022cd3f4.slot].value!=0) {
   switch (self->id) {
   case 0x1aac:
    if (func_0202f4cc(func_ov002_021b9ecc(data_ov002_022cd3f4.player,data_ov002_022cd3f4.slot))==0) return 0;
    break;
   case 0x1b2c:
    if (func_0202f500(func_ov002_021b9ecc(data_ov002_022cd3f4.player,data_ov002_022cd3f4.slot))==0) return 0;
    break;
   }
   return 1;
  }
 }
 return 0;
}
