typedef struct { unsigned int id:13; unsigned int rest:19; unsigned int pad[4]; } Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_0226e46c(int value);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
/* Original calls these thunks with only the explicitly initialized arguments. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021c8940();
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_021bc618(int arg0);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021c93cc(int a, int b, int bit);
extern int func_ov002_022536e8(int self, int arg1, int arg2);

int func_ov002_0226e580(int player, int card) {
    int count = func_ov002_0226e46c(card);
    int flag = func_ov002_021b3ecc(player, 11, 0x14a0);
    int i;
    Slot *slot;
    int result;
    if (func_ov002_021ca2b8(player) == 0) return 0;
    if (func_ov002_021ca698(player, player) == 0) return 0;
    if (func_ov002_021bc618(player) == 0 && flag == 0) return 0;
    if (flag != 0) {
        slot = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        for (i = 0; i < 5; i++, slot++) {
            if (slot->id != 0) {
                if (card == 0x1466 || card == 0x18b4 || card == 0x19ca) {
                    int value = func_ov002_021c8940(player, i);
                    result = value == func_0202b878(card);
                } else {
                    result = func_ov002_021c93cc(player, i, func_0202b890(card));
                }
                if (result != 0) {
                    if (--count == 0) return 1;
                }
            }
        }
        return 0;
    } else {
        return func_ov002_022536e8(player, card, 0) >= count;
    }
}
