extern char data_ov002_022cf16c[];
extern int func_ov002_0227b0b8(int player, int count, int mode);
extern int func_ov002_02280b74(int player, int other, int except, int attack, int defense);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_022812ac(int arg0, int arg1);
extern int func_ov002_02259f74(int x);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bd308(int player);
extern int func_ov002_021c3a6c(int arg0, int arg1);

int func_ov002_0227b174(int player, int attack, int defense)
{
    int margin;
    int diff;
    int other = 1 - player;
    int max = func_ov002_0227b0b8(other, -1, 0);
    int a = func_ov002_02280b74(player, player, -1, 1, 0);
    int b = func_ov002_02280b74(player, player, -1, 0, 1);
    margin = 100;
    if (func_ov002_021bbf50(other) == 0 &&
        *(int *)(data_ov002_022cf16c + (other & 1) * 0x868) <= func_ov002_022812ac(player, player) &&
        func_ov002_02259f74(player) != 0) {
        if (attack > 0)
            return 0;
    }
    if (attack == 0)
        return 1;
    if (func_ov002_021bae7c(player, 0x13f9, -1) != 0)
        return 0;
    if (max <= 1500)
        max = 1500;
    diff = max - attack;
    if (diff >= 1000)
        return 1;
    if (func_ov002_021bd308(player) != 0) {
        if (func_ov002_021c3a6c(player, 22) != 0)
            margin = 300;
    }
    if (func_ov002_021bae7c(other, 0x130c, -1) != 0)
        margin = 0;
    if (attack >= defense) {
        if (diff <= margin && *(int *)(data_ov002_022cf16c + (player & 1) * 0x868) > margin)
            return 0;
    } else {
        if (attack >= max && attack >= 1700)
            return 0;
        if (a <= b)
            a = b;
        if (defense >= a && defense > 1500)
            return 1;
    }
    if (attack >= max)
        return 0;
    if (diff > margin)
        return 1;
    return -1;
}



