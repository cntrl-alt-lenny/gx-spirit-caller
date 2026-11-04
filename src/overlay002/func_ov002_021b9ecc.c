typedef unsigned short u16;
struct Card { unsigned id:13; unsigned rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern int func_ov002_021bd85c(int a, int b);
int func_ov002_021b9ecc(int player, int idx) {
 int io;
 int po;
 int id;
 io = idx * 0x14;
 po = (player & 1) * 0x868;
 id = ((struct Card *)(data_ov002_022cf16c + po + 0x30 + io))->id;
 if (idx <= 4) {
  if (id == 0x1a74) {
   id = func_ov002_021b4120(player, idx, id);
   if (id == -1 || func_ov002_021bd85c(id, -1) != 0) return 0x1a74;
  }
  switch (id) {
  case 0x19a6: {
   unsigned f = *(unsigned *)(io + (data_ov002_022cf1ac + po));
   int a = (f >> 6) & 1;
   int b = ((f >> 1) | (f >> 2)) & 1;
   int h = *(u16 *)(io + (data_ov002_022cf1a4 + po));
   int r = h & ~a;
   if (r & ~b) {
    if (func_ov002_021bd85c(0x18f9, -1) == 0) return 0x18f9;
   }
   break;
  }
  case 0x19bc: {
   unsigned f = *(unsigned *)(io + (data_ov002_022cf1ac + po));
   int a = (f >> 6) & 1;
   int b = ((f >> 1) | (f >> 2)) & 1;
   int h = *(u16 *)(io + (data_ov002_022cf1a4 + po));
   int r = h & ~a;
   if (r & ~b) {
    if (func_ov002_021bd85c(0x18f6, -1) == 0) return 0x18f6;
   }
   break;
  }
  }
 }
 return id;
}
