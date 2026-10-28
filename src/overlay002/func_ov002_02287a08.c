typedef unsigned short u16;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c84a8(int a, int b);
int func_ov002_02287a08(struct Self *self) {
    int offset;
    int j;
    int maximum = 0;
    int i;
    for (i = 0; i < 5; i++) {
        if (maximum <= func_ov002_021c8470(self->bit0, i))
            maximum = func_ov002_021c8470(self->bit0, i);
        if (maximum <= func_ov002_021c84a8(self->bit0, i))
            maximum = func_ov002_021c84a8(self->bit0, i);
    }
    for (j = 0, offset = 0; j < 5; j++, offset += 0x14) {
        if (*(u16 *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + offset + 0x38) != 0) {
            if (func_ov002_021c8470(1 - self->bit0, j) > maximum)
                return 1;
        }
    }
    return 0;
}




