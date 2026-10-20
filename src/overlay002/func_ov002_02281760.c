struct Slot { unsigned int id : 13; unsigned int rest : 19; };
extern char data_ov002_022cf16c[];
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_022815a4(int id, int flag);

int func_ov002_02281760(int a0, int player) {
    int i;
    int result = 0;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    char *id_ptr = row + 0x30;
    for (i = 0; i <= 4; i++, row += 0x14, id_ptr += 0x14) {
        if (((*(unsigned int *)(row + 0x40) >> 8) & 1) != 0) {
            if (func_ov002_022575c8(a0, player, i) != 0) {
                if (func_ov002_022815a4(((struct Slot *)id_ptr)->id, 0) != 0)
                    result++;
            }
        }
    }
    return result;
}

