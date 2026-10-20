struct Id { unsigned int id:13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021eace4(void *self, int player, int idx);
/* The original supplies two arguments although the thunk definition takes four. */
extern int func_ov002_02257878();
int func_ov002_02201f9c(void *self) {
    int player;
    int i;
    char *id;
    char *row;
    player = 0;
    do {
        i = 0;
        row = data_ov002_022cf16c + (player & 1) * 0x868;
        id = row + 0x30;
        do {
            if (((struct Id *)id)->id != 0 && *(unsigned short *)(row + 0x38) == 0 &&
                *(unsigned short *)(row + 0x36) != 0) return 1;
            id += 0x14;
            row += 0x14;
        } while (++i < 5);
    } while (++player < 2);
    return func_ov002_02257878(self, func_ov002_021eace4) > 0;
}

