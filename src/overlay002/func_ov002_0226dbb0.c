extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021bc8c8(int player, int owner, int slot);
extern int func_ov002_021bc288(int player, int slot);
typedef struct { int values[3]; } Ids;
extern Ids data_ov002_022c85e0;
extern unsigned char data_ov002_022cf16c[];

int func_ov002_0226dbb0(int player)
{
    int count = func_ov002_021bc618(player);
    Ids ids = data_ov002_022c85e0;
    int id;
    int found;
    int other;
    int j;
    unsigned char *p;
    int k;
    int i;
    int offset;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    other = 1 - player;
    offset = (other & 1) * 0x868;
    for (i = 0; i < 3; i++) {
        id = ids.values[i];
        found = 0;
        for (j = 0; j <= 4; j++) {
            if (id == func_ov002_021b9ecc(player, j) && func_ov002_021bc8c8(player, player, j)) {
                found = 1;
                if (func_ov002_021bc288(player, j)) count++;
            }
        }
        p = data_ov002_022cf16c + offset;
        for (k = 0; k <= 4; p += 0x14, k++) {
            if (id == func_ov002_021b9ecc(other, k) && func_ov002_021bc8c8(player, other, k) &&
                *(unsigned short *)(p + 0x38)) {
                found = 1;
                break;
            }
        }
        if (!found) return 0;
    }
    return count != 0;
}




