extern int func_ov002_0227d27c(int);
extern int func_ov002_021c9c94(int);
extern int func_ov002_021bbf50(int);
extern int func_ov002_021bd364(int, int);
extern int func_ov002_02280980(int);
extern char data_ov002_022cf178[];

int func_ov002_0228635c(int player, int card) {
    if (func_ov002_0227d27c(card)) return 1;
    if (func_ov002_021c9c94(player)) {
        switch (card) {
        case 0x119b:
        case 0x11c3:
        case 0x179a:
            return func_ov002_021bbf50(1 - player) > 0;
        case 0x1152:
            return func_ov002_021bd364(player, 0x16) > 0;
        case 0x100c:
            return func_ov002_021bd364(player, 0x17) > 0;
        case 0x11c2:
        case 0x11f5:
            return *(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868) < 3;
        case 0x1331:
        case 0x1369:
            return func_ov002_02280980(player) < 0;
        }
    }
    return 0;
}
