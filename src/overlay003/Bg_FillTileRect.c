/* Bg_FillTileRect: fill an h*w cell rect of a BG map with sequentially
 * numbered tiles at a fixed palette — each cell is (tile | pal<<12), tile wrapping
 * at 16 bits; rows step by one screen row (0x20 cells). (ov003_core.h) */
void Bg_FillTileRect(int dummy, short *p, int tile, int w, int h, int pal) {
    int row;
    for (row = 0; row < h; row++) {
        int col;
        for (col = 0; col < w; col++) {
            p[col] = tile | (pal << 12);
            tile = (unsigned)(tile + 1) << 16 >> 16;
        }
        p += 0x20;
    }
}
