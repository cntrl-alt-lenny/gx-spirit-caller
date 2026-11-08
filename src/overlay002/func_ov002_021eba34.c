typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
    char padding[16];
} Row;
typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short a : 6;
    unsigned short key : 9;
} Self;
struct Table { char header[0x30]; Row rows[100]; char tail[104]; };
extern struct Table data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a0, int a1);
int func_ov002_021eba34(Self *self, int player, int idx) {
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    if (data_ov002_022cf16c[player & 1].rows[idx].id == 0)
        return 0;
    return self->key != data_ov002_022cf16c[player & 1].rows[idx].lo + (data_ov002_022cf16c[player & 1].rows[idx].hi << 1);
}
