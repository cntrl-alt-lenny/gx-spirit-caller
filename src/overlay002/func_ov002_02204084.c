/* func_ov002_02204084 (ov002): guarded probe of two func_ov002_021ca698
 * partner checks (SEQUENTIAL, not else-if -- confirmed against the raw
 * disassembly: the first attempt's failure to trigger func_ov002_022536e8
 * falls through into the second attempt rather than skipping it), then a
 * final bits[12:13]==0 check. C-60 table family for the guard.
 */

typedef unsigned short u16;

struct S02204084 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_13 : 2;
    u16 b14_15 : 2;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021bbc58(int bit, int k);
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(unsigned int bit, u16 a, int b);

int func_ov002_02204084(struct S02204084 *self) {
    if (func_ov002_021bbc58(self->bit0, 3) != 0 &&
        *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868) > 0x1f4) {
        if (func_ov002_021ca698(self->bit0, 1 - self->bit0) != 0) {
            if (func_ov002_022536e8(self->bit0, self->f0, 0) != 0) {
                return 2;
            }
        }
        if (func_ov002_021ca698(self->bit0, self->bit0) != 0) {
            if (func_ov002_022536e8(1 - self->bit0, self->f0, 0) != 0) {
                return 2;
            }
        }
    }
    return self->b12_13 == 0;
}
