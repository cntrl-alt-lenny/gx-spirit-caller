extern char data_ov002_022cf16c[];
extern int func_0202df78(int id, int arg);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int area, int index);
struct Slot { unsigned id:13; unsigned rest:19; };
void func_ov002_0224a3d0(int player, int card, int index) {
    int replacement;
    int id = ((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + index * 4 + 0x120))->id;
    switch (card) {
    case 0x1476: replacement = 0x1121; break;
    case 0x15d0: replacement = 0x15d1; break;
    case 0x15d4: replacement = 0x15d5; break;
    case 0x165b: replacement = 0x1645; break;
    case 0x16fd: replacement = card; break;
    case 0x17dd: replacement = 0xff8; break;
    case 0x1821: replacement = 0x1820; break;
    case 0x189a: replacement = 0xfa7; break;
    }
    if (func_0202df78(id, replacement) == 0) return;
    if (func_ov002_021ca3f0(player, replacement) == 0) return;
    func_ov002_02253458(player, 11, index);
}

