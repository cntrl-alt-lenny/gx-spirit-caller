extern char data_ov002_022cf16c[];
extern void func_ov002_0227aee0(int a, int b, int *out);
extern void func_ov002_0227af30(int a, int b, int *out);

int func_ov002_02280b74(int a, int player, int skip, int attack, int defense) {
    int i;
    int max;
    char *cursor;
    int buf[11];
    cursor = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
    max = -1;
    for (i = 0; i < 5; i++, cursor += 0x14) {
        if (i != skip && ((unsigned int)(*(int *)cursor << 19) >> 19) != 0) {
            int v = 0;
            if (a == player)
                func_ov002_0227aee0(player, i, buf);
            else
                func_ov002_0227af30(player, i, buf);
            if (attack != 0) {
                v = buf[5];
                if (v < 0) v = 0;
            }
            if (defense != 0) {
                if (v <= buf[6]) v = buf[6];
            }
            if (v > max) max = v;
        }
    }
    return max;
}

