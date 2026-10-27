typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
struct Player { char pad[0x18]; u32 count; };
extern char data_ov002_022cf16c[];
struct Count { u32 count; char pad[0x864]; };
extern struct Count data_ov002_022cf184[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_0223c918(int a, int b);
extern void func_ov002_0224fb58(int player, int arg1, int mode);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02252664(int player, int arg1, int mode) {
    if (mode == 0) {
        u32 i;
        struct Card *card;
        struct Player *p;
        u32 base;
        u32 count = data_ov002_022cf184[player & 1].count;
        i = 0;
        if (i < count) {
            base = (u32)data_ov002_022cf16c + (player & 1) * 0x868;
            p = (struct Player *)base;
            card = (struct Card *)(base + 0x3a0);
            do {
                int id = card->id;
                if (func_0202b890(id) == 2 && func_0202b878(id) == 7 &&
                    func_ov002_021ca3f0(player, id) != 0 && func_ov002_0223c918(player, id) != 0) {
                    func_ov002_02253458(player, 12, i);
                }
                i++;
                card++;
            } while (i < p->count);
        }
    } else {
        func_ov002_0224fb58(player, arg1, mode);
    }
}










