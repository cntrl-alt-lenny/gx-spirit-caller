struct Ov002Self;
struct FlagRow { unsigned short value; char pad[18]; };
struct CardRow { char pad[0x30]; unsigned id:13; unsigned rest:19; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021e7868(struct Ov002Self *self, int player, int idx);
/* Original supplies only two arguments to these four-argument thunks. */
extern int func_ov002_021c8940();
extern int func_ov002_021c84e0();
extern int func_0202e340(int unused0);
int func_ov002_021ec1a4(struct Ov002Self *self, int player, int idx) {
 int side, slot, kind; char *row;
 if (func_ov002_021e7868(self, player, idx) == 0) return 0;
 slot = idx * 0x14;
 side = (player & 1) * 0x868;
 if (((struct FlagRow *)(data_ov002_022cf1a4 + side))[idx].value == 0) return 0;
 kind = func_ov002_021c8940(player, idx);
 switch (*(unsigned short *)self) {
 case 0x13b0: return kind == 7;
 case 0x14cd: return kind == 3;
 case 0x14ce: return kind == 1;
 case 0x15d8: { row = data_ov002_022cf16c + side; row += slot; return func_0202e340(((struct CardRow *)row)->id); }
 case 0x1ad6: return func_ov002_021c84e0(player, idx) <= 3;
 case 0x1ad7: return func_ov002_021c84e0(player, idx) <= 5;
 case 0x1b41: return kind == 7 || kind == 1;
 case 0x1b42: return kind == 15 || kind == 18;
 case 0x1b43: return kind == 3 || kind == 2;
 }
 return 1;
}

















