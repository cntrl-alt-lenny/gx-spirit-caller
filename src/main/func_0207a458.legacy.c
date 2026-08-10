/* func_0207a458: 5-way jump-table dispatch on self->kind (offset 2).
 * C-44 lever: case bodies must be written in .s body-ADDRESS order,
 * not case-value order -- case 0's body sits first, then the shared
 * case1/case3 body, then the shared case2/case4/default body.
 */

struct S0207a458 {
    unsigned char pad_00[0x2];
    unsigned short kind; /* 0x2 */
};

extern int func_0207b038(int mode);
extern int func_0207af28(void);
extern int func_0207b13c(int a, void *b, int c, int d);
extern void *data_021a088c;

void func_0207a458(struct S0207a458 *self) {
    switch (self->kind) {
    case 0:
        if (*(int *)((char *)data_021a088c + 0x2260) == 0xc) {
            func_0207b038(0xa);
            func_0207af28();
        } else {
            *(short *)((char *)data_021a088c + 0x2282) = 0;
            func_0207b038(3);
            func_0207b13c(0, (char *)data_021a088c + 0x2140, 0, 0x83d);
        }
        break;
    case 1:
    case 3:
        func_0207b038(0xa);
        func_0207af28();
        break;
    case 2:
    case 4:
    default:
        func_0207b038(0xb);
        func_0207b13c(7, (char *)data_021a088c + 0x2140, 0, 0x84f);
        break;
    }
}
