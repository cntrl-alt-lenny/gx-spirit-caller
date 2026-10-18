typedef unsigned short u16;
struct S0220a9b4 { u16 f0; u16 bit0:1; u16 a:13; u16 bit14:1; u16 rest:1; };
struct Ent { int v; char pad[0x864]; };
extern struct Ent data_ov002_022cf17c[];
extern int func_ov002_021ca63c(int bit0, int k);
int func_ov002_0220a9b4(struct S0220a9b4 *self) {
    if (func_ov002_021ca63c(self->bit0, 1) != 0) {
        return data_ov002_022cf17c[(self->bit0 ^ self->bit14) & 1].v != 0;
    }
    return 0;
}
