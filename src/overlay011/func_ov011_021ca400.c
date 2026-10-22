extern char data_ov011_021d4000[];
struct MapState {
    char pad[0x28c];
    unsigned char *tiles;
    unsigned char *map;
    char pad2[8];
    unsigned int stride : 3;
    unsigned int rest : 29;
};
extern struct MapState data_ov011_021d403c;
int func_ov011_021ca400(int x, int y) {
    struct MapState *p = &data_ov011_021d403c;
    int tx = x & 7;
    int row = y >> 3;
    int ty = y & 7;
    int odd = tx & 1;
    int entry, palette, index;
    unsigned char *tile;
    switch (*(int *)(data_ov011_021d4000 + 0x2a0)) {
    case 0:
        entry = *(unsigned short *)(p->map + p->stride * ((x >> 3) + (row << 5)));
        palette = entry & 0x3ff;
        palette &= 0xf000;
        tile = p->tiles + ((entry & 0x3ff) << 5);
        return (tile[(ty << 2) + (tx >> 1)] >> (odd << 2)) | ((palette >> 12) << 4);
    case 1:
        entry = *(unsigned short *)(p->map + p->stride * ((x >> 3) + (row << 6)));
        tile = p->tiles + ((entry & 0x3ff) << 6);
        return tile[tx + (ty << 3)];
    default: return 0;
    }
}



