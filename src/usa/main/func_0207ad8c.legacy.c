/* func_0207ad8c: Style A epilogue (sub sp #4 + pop{lr}+bx lr) -> legacy
 * tier. Triple field guard, then a jump-table switch on a value read
 * through data_021a07ac+0x2000+0x260. C-44: case bodies ordered by
 * address (8, then 9/12 shared, then 10, then 11/default shared).
 */

typedef struct {
    char _pad_0[0x2];
    unsigned short field_2;
    unsigned short field_4;
    unsigned short field_6;
} func_0207ae74_t;

extern void *data_021a07ac;
extern void func_0207ae40(void);
extern void func_0207af50(int arg);

void func_0207ad8c(func_0207ae74_t *self) {
    if (self->field_2 != 8)
        return;
    if (self->field_4 != 22)
        return;
    if (self->field_6 != 37)
        return;

    {
        int val = *(int *)((char *)data_021a07ac + 0x2000 + 0x260);
        switch (val) {
        case 8:
            func_0207af50(0xc);
            break;
        case 9:
        case 12:
            func_0207ae40();
            break;
        case 10:
            func_0207af50(0xc);
            break;
        case 11:
        default:
            break;
        }
    }
}
