typedef unsigned short u16;
struct SA0 { u16 val0; u16 bit0:1; u16 field1_5:5; };
extern char data_ov002_022cf1ac[];
extern int func_ov002_02208bfc(struct SA0 *a0, int unused1);
int func_ov002_02209340(struct SA0 *a0, int arg1) {
    unsigned int flags = *(unsigned int *)(data_ov002_022cf1ac + (a0->bit0 & 1) * 0x868 + a0->field1_5 * 20);
    if ((flags >> 16) & 1) return 0;
    if ((flags >> 18) & 1) return 0;
    if ((flags >> 17) & 1) return 0;
    if ((flags >> 19) & 1) return 0;
    return func_ov002_02208bfc(a0, arg1);
}
