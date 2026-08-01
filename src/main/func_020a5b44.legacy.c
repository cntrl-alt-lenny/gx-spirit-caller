/* func_020a5b44: copy a0's mode byte into a1dst, then dispatch on it.
 * Routed via .legacy.c: no r3-spill, Style A 2-step epilogue
 * (push {r4,r5,r6,lr}; ... ldmia sp!,{r4,r5,r6,lr}; bx lr, incl.
 * predicated early returns). Cases 7/8/9 share a common "return r4" tail;
 * default returns 0 directly (does not go through the shared tail).
 * Check order (7,8,9) already matches body layout order -- no C-44
 * reordering needed here.
 */

typedef struct {
    unsigned char field_0x0;
    unsigned char field_0x1;
    unsigned char field_0x2;
    unsigned char field_0x3;
} SrcObj020a5b44;

typedef struct {
    unsigned char field_0x0;
    unsigned char field_0x1;
    unsigned short field_0x2;
} DstObj020a5b44;

typedef struct {
    int field_0x0;
    int field_0x4;
} Data021a9928;

extern void *data_021a9924;
extern Data021a9928 data_021a9928;
extern int func_020a5a34(int x);
extern void func_02094688(void *a, void *b, int c);
extern int func_020a5a94(void *a, int b);

int func_020a5b44(SrcObj020a5b44 *a0, DstObj020a5b44 *a1dst, int a2) {
    int r4_result;

    a1dst->field_0x0 = a0->field_0x0;
    unsigned char mode = a1dst->field_0x0;

    switch (mode) {
    case 7:
        if (func_020a5a34(a2) != 0) {
            return (int)((char *)data_021a9924 + (a2 - 1) * 32);
        }
        *(unsigned char *)&a1dst->field_0x2 = a0->field_0x1;
        if (*(unsigned char *)&a1dst->field_0x2 > data_021a9928.field_0x4) {
            return 0;
        }
        func_02094688((char *)a0 + 2, (char *)a1dst + 3, data_021a9928.field_0x0);
        r4_result = func_020a5a94(a1dst, a2);
        break;

    case 8:
        r4_result = (int)((char *)a0 + 3);
        a1dst->field_0x2 = a0->field_0x1 & 0xff;
        a1dst->field_0x2 = a1dst->field_0x2 | ((a0->field_0x2 << 8) & 0xff00);
        break;

    case 9:
        r4_result = (int)((char *)a0 + 3);
        a1dst->field_0x2 = a0->field_0x1 & 0xff;
        a1dst->field_0x2 = a1dst->field_0x2 | ((a0->field_0x2 << 8) & 0xff00);
        func_02094688((char *)a0 + 3, (char *)a1dst + 4, data_021a9928.field_0x0);
        r4_result = r4_result + data_021a9928.field_0x0;
        break;

    default:
        return 0;
    }
    return r4_result;
}
