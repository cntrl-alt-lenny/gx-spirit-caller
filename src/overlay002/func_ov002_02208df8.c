typedef unsigned short u16;
struct SA0 {
    u16 val0;
    u16 bit0 : 1;
    u16 field1_5 : 5;
};
struct State { char pad[12]; unsigned int count; char rest[0x858]; };
extern char data_ov002_022cf178[];
extern struct State data_ov002_022cf16c[];
extern int func_ov002_021c23ac(int, int);
extern int func_ov002_021bc288(int, int);
extern int func_ov002_021ff2b8(int unused_a, int b);
/* This caller sets only r0; the thunk preserves the other argument registers. */
extern int func_ov002_021ca2b8();
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_02208df8(struct SA0 *a0) {
    unsigned int i;
    if (func_ov002_021c23ac(a0->bit0, a0->field1_5) == 0) return 0;
    if (func_ov002_021ff2b8((int)a0, a0->bit0) == 0) {
        if (func_ov002_021bc288(a0->bit0, a0->field1_5) == 0) return 0;
    }
    if (func_ov002_021ca2b8(a0->bit0) == 0) return 0;
    i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + (a0->bit0 & 1) * 0x868)) {
        do {
            if (func_ov002_022536e8((void *)a0->bit0, a0->val0, i) != 0) return 1;
            i++;
        } while (i < data_ov002_022cf16c[a0->bit0 & 1].count);
    }
    return 0;
}

