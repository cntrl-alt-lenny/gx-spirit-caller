/* func_ov006_021c32ac: grid-icon setup — re-derive the DuelIconEntry index
 * as gridCol + gridRow*4 + 1 (self's own +0x5c/+0x60 fields; round-trips
 * onto records 1-7 of data_ov006_021cdf88, see that file's header),
 * acquire a UI handle via func_02021660(self->f0, 5, 8), then push five
 * properties (x+20, y+20, unk08, unk0A, style) through func_020216b0.
 * style is 0xc9 normally, or 0xe9 when self->f68 is set and the global
 * flag data_ov006_0225e068[0] reads zero (0 when self->f68 is clear).
 * Returns 1. */
extern int func_02021660(int a, int b, int c);
extern int func_020216b0(int handle, int propId, int value);

typedef struct {
    short x;       /* +0x00 */
    short y;       /* +0x02 */
    short gridCol; /* +0x04 */
    short gridRow; /* +0x06 */
    short unk08;   /* +0x08 */
    short unk0A;   /* +0x0A */
    int   unk0C;   /* +0x0C */
    int   iconId0; /* +0x10 */
    int   iconId1; /* +0x14 */
    int   iconId2; /* +0x18 */
} DuelIconEntry;
extern DuelIconEntry data_ov006_021cdf88[8];
extern int data_ov006_0225e068[];

int func_ov006_021c32ac(char *self) {
    int row = *(int *)(self + 0x60);
    int col = *(int *)(self + 0x5c);
    char *flagWord = (char *)data_ov006_0225e068;
    DuelIconEntry *e = &data_ov006_021cdf88[row * 4 + 1 + col];
    int handle = func_02021660(*(int *)self, 5, 8);
    int flag = *(int *)(self + 0x68);
    int style;

    if (flag != 0) {
        int cond;
        if (*(int *)flagWord != 0) cond = 1; else cond = 0;
        style = 0xc9;
        if (cond == 0) style |= 0x20;
    } else {
        style = 0;
    }

    func_020216b0(handle, 3, e->x + 0x14);
    func_020216b0(handle, 4, e->y + 0x14);
    func_020216b0(handle, 0x11, e->unk08);
    func_020216b0(handle, 0x12, e->unk0A);
    func_020216b0(handle, 0, style);
    return 1;
}
