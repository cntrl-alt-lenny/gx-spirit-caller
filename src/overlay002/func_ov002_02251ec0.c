struct Slot { unsigned id : 13; };
struct Count { unsigned count; char pad[0x864]; };
extern struct Count data_ov002_022cf184[];
extern char data_ov002_022cf16c[];
extern int func_0202f3e8(int a0);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_0223bb28(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02251ec0(int player) {
    unsigned i;
    char *p;
    char *base;
    i = 0;
    if (i < data_ov002_022cf184[player & 1].count) {
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        p = base + 0x3a0;
        do {
            int id = ((struct Slot *)p)->id;
            if (func_0202f3e8(id) != 0 &&
                func_ov002_021ca3f0(player, id) != 0 &&
                func_ov002_0223bb28(player, id) != 0)
                func_ov002_02253458(player, 12, i);
            i++;
            p += 4;
        } while (i < *(unsigned *)(base + 0x18));
    }
}
