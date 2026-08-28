extern int func_0202f994(int id);

typedef struct {
    char _pad[0x30];
    unsigned int id : 13;
} Row0228d9ec;

extern char data_ov002_022cf08c[];
extern char data_ov002_022cf0c4[];

int func_ov002_0228d8dc(int player, int idx) {
    int result = 0;
    int off = idx * 0x14;
    int poff = (player & 1) * 0x868;
    int row = (int)data_ov002_022cf08c + poff;
    Row0228d9ec *slot = (Row0228d9ec *)(row + off);
    if (func_0202f994(slot->id) != 0) {
        int row2 = (int)data_ov002_022cf0c4 + poff;
        if (*(unsigned short *)(off + row2) == 0)
            result = 1;
    }
    return result;
}
