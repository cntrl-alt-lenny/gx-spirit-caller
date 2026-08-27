/* func_0207a370: 5-way jump-table dispatch on self->kind (offset 2).
 * C-44 lever: case bodies must be written in .s body-ADDRESS order,
 * not case-value order -- case 0's body sits first, then the shared
 * case1/case3 body, then the shared case2/case4/default body.
 */

struct S0207a458 {
    unsigned char pad_00[0x2];
    unsigned short kind; /* 0x2 */
};

extern int func_0207af50(int mode);
extern int func_0207ae40(void);
extern int func_0207b054(int a, void *b, int c, int d);
extern void *data_021a07ac;

void func_0207a370(struct S0207a458 *self) {
    switch (self->kind) {
    case 0:
        if (*(int *)((char *)data_021a07ac + 0x2260) == 0xc) {
            func_0207af50(0xa);
            func_0207ae40();
        } else {
            *(short *)((char *)data_021a07ac + 0x2282) = 0;
            func_0207af50(3);
            func_0207b054(0, (char *)data_021a07ac + 0x2140, 0, 0x83d);
        }
        break;
    case 1:
    case 3:
        func_0207af50(0xa);
        func_0207ae40();
        break;
    case 2:
    case 4:
    default:
        func_0207af50(0xb);
        func_0207b054(7, (char *)data_021a07ac + 0x2140, 0, 0x84f);
        break;
    }
}
