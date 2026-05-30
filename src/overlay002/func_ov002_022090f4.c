/* func_ov002_022090f4: C-39f (1-bit0)-indexed 0x868-table -> v >= 8. */
typedef unsigned short u16;
struct S022090f4 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf178[];
int func_ov002_022090f4(struct S022090f4 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf178 + ((1 - self->bit0) & 1) * 0x868);
    return v >= 8;
}
