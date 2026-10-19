typedef struct {
    char _pad[0x3c];
    int f_3c;
    int f_40;
} state_3c_40_t;
typedef struct { int a[20]; } tile_table_t;
typedef struct { char pad[0x4f6]; unsigned short map[3][32]; } screen_t;
extern tile_table_t data_ov006_021cb848;
extern int func_ov006_021c6f24(state_3c_40_t *p);
extern int func_0208e120(void);
int func_ov006_021c6c78(state_3c_40_t *p)
{
    tile_table_t table = data_ov006_021cb848;
    int tile = table.a[(unsigned int)(*(int *)((char *)p + 0x48) / 4) % 20];
    int x, y;
    if (func_ov006_021c6f24(p) && tile >= 0) {
        int base = tile * 15 + 0x20a;
        for (y = 0; y < 3; y++) {
            for (x = 0; x < 5; x++) {
                ((screen_t *)func_0208e120())->map[y][x] = (x + base) | 0x3000;
            }
            base += 5;
        }
    } else {
        for (y = 0; y < 3; y++) {
            for (x = 0; x < 5; x++) {
                ((screen_t *)func_0208e120())->map[y][x] = 0x3000;
            }
        }
    }
    return 1;
}






