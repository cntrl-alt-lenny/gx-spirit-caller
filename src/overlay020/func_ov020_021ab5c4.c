typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 a, b, flags, d; } Entry;
extern int func_0207e638(int *o, unsigned a1);
extern u32 func_ov020_021aa8f0(void *a, Entry **out, void *c, int d, int priority, int palette);
typedef struct { char pad[0x924]; int *sprites; char pad2[0xc0]; u16 table[10][4]; u16 selected[10]; } State;
extern State data_ov020_021ae0a8;
int func_ov020_021ab5c4(int count, void *a, Entry **out) {
    State *base = &data_ov020_021ae0a8;
    int total = 0;
    int i;
    int pos[2];
    int value;
    int sprite;
    if (count < 0) count = 0;
    else if (count >= 10) count = 9;
    for (i = 0; i <= count; i++) {
        value = base->selected[i] == 0xffff ? 0xffff : base->table[i][base->selected[i]];
        pos[0] = (0x48 + (i * 2 / 10) * 0x6c) << 12;
        pos[1] = (0x24 + (i % 5) * 0x1c) << 12;
        if (value <= 1) {
            sprite = func_0207e638(base->sprites, 2);
        } else {
            sprite = func_0207e638(base->sprites, 3);
            pos[0] += 0x1000;
            pos[1] += 0x1000;
        }
        total += func_ov020_021aa8f0(a, out, (void *)sprite, (int)pos, 0, -1);
    }
    return total;
}






