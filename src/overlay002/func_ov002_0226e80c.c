typedef struct { unsigned int id : 13; unsigned int rest : 19; unsigned int pad[4]; } Slot;
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021bc72c(int a, int b, int c);
extern int func_ov002_021bca00(int a, int b, int c, int d);
extern int func_ov002_021c8940();
int func_ov002_0226e80c(int player, int card) {
    int i;
    int count = 0;
    int bonus = 0;
    int flag = 0;
    Slot *slot;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    slot = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
    for (i = 0; i < 5; i++, slot++) {
        if (slot->id != 0 && func_ov002_021bc72c(player, player, i) != 0) {
            int value = func_ov002_021c8940(player, i);
            if (value == func_0202b878(card)) {
                count++;
                if (func_ov002_021bca00(player, card, player, i) != 0) bonus++;
                if (func_ov002_021bc288(player, i) != 0) flag = 1;
            }
        }
    }
    if (flag == 0 && func_ov002_021bc6c4(player) == 0) return 0;
    return count + bonus >= 3;
}



