typedef unsigned short u16;
struct Entry { unsigned id:13; unsigned rest:19; int f4; u16 h8; u16 hA; int fC; unsigned flags; };
struct Player { char pad[48]; struct Entry cards[11]; char tail[1884]; };
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022ce288[];
extern int func_0202e42c(int x);
extern int func_ov002_021de480(int a, int b, int c, int d);
int func_ov002_022565c4(void) {
 int side;
 int p;
 int i;
 int j;
 int cnt;
 for (p = 0; p < 2; p++) {
  side = *(int *)(data_ov002_022d016c + 0xcec) ^ p;
  for (i = 5; i < 10; i++) {
   unsigned f;
   if (data_ov002_022cf16c[side & 1].cards[i].id != 0x169a) continue;
   if (data_ov002_022cf16c[side & 1].cards[i].h8 == 0) continue;
   f = data_ov002_022cf16c[side & 1].cards[i].flags;
   if ((f >> 6) & 1) continue;
   if (((f >> 1) | (f >> 2)) & 1) {
    if (*(int *)(data_ov002_022ce288 + 0x484) == 0) continue;
   }
   cnt = 0;
   for (j = 0; j <= 10; j++) {
    if (data_ov002_022cf16c[side & 1].cards[j].h8 != 0) {
     unsigned g = data_ov002_022cf16c[side & 1].cards[j].flags;
     if (!(((g >> 1) | (g >> 2)) & 1)) {
      if (func_0202e42c(data_ov002_022cf16c[side & 1].cards[j].id) != 0) cnt++;
     }
    }
   }
   if (cnt == 0) {
    func_ov002_021de480(side, i, 0, 0);
    return 1;
   }
  }
 }
 return 0;
}








