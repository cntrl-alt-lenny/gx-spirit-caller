/* func_ov002_0226ead0: guard on func_ov002_021bc6c4(player,arg1)>=0 (true
 * -> 1). Else scan i in [0,4]: pick func_ov002_021bc72c or _bc8c8 by
 * arg1's sign (both called as (player,player,i)); if nonzero, confirm via
 * func_ov002_021bc288(player,i). */
extern int func_ov002_021bc6c4(int player, int arg1);
extern int func_ov002_021bc8c8(int player, int player2, int i);
extern int func_ov002_021bc72c(int player, int player2, int i);
extern int func_ov002_021bc288(int player, int i);

int func_ov002_0226ead0(int player, int arg1) {
    int i;

    if (func_ov002_021bc6c4(player, arg1) >= 0)
        return 1;

    for (i = 0; i <= 4; i++) {
        int result;
        if (arg1 > 0)
            result = func_ov002_021bc8c8(player, player, i);
        else
            result = func_ov002_021bc72c(player, player, i);

        if (result != 0) {
            if (func_ov002_021bc288(player, i) != 0)
                return 1;
        }
    }
    return 0;
}
