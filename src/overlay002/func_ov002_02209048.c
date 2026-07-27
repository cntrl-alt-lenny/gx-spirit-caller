/* func_ov002_02209048: !bit0 per-player double-table OR-guard, frameless.
 *   idx = ((1 - self->b0) & 1) * 0x868;
 *   r = 1;
 *   if (*(int*)(cf178+idx)==0 && *(int*)(cf17c+idx)==0) r = 0;
 *   return r;     (&& gives cmpeq + conditional 2nd load reusing idx)
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];

int func_ov002_02209048(struct Ov002Self *self) {
    int idx = ((1 - self->b0) & 1) * 0x868;
    int r = 1;
    if (*(int *)(data_ov002_022cf178 + idx) == 0 &&
        *(int *)(data_ov002_022cf17c + idx) == 0)
        r = 0;
    return r;
}
