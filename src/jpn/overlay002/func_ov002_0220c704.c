/* func_ov002_0220c704: C-39f (1-bit0)-indexed 0x868-table -> v >= 2. */
typedef unsigned short u16;
struct S0220c7f4 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf0a4[];
int func_ov002_0220c704(struct S0220c7f4 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf0a4 + ((1 - self->bit0) & 1) * 0x868);
    return v >= 2;
}
