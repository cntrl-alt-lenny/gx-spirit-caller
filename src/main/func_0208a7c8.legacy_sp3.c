/* func_0208a7c8: begin/end-bracketed update step. Brackets the whole
 * function with func_020927b8(&data_021a5d18) / func_02092748(&data_021a5d18)
 * (and, if data_021a5840 is set, the same pair on
 * data_021a5840+0x4c8), and in between: tests bit1 of a->field_110
 * (calls func_020882d4(a) if set), tests bit0 (calls a->field_16c(a)
 * if set, a callback), then unconditionally calls func_0208a764(a).
 *
 * sp3 routing: consistent with the rest of this address range
 * (docs/research/style-a-epilogue.md).
 */

typedef struct {
    int bit0 : 1;
    int bit1 : 1;
} Field110_t;

typedef struct {
    char pad_00[0x110];
    Field110_t field_110;
    char pad_114[0x16c - 0x110 - 4];
    int (*field_16c)(void *a);
} Obj_0208a7c8_t;

extern void *data_021a5840;
extern int func_020882d4(Obj_0208a7c8_t *a);
extern int func_0208a764(Obj_0208a7c8_t *a);
extern int func_02092748(void *p);
extern int func_020927b8(void *p);

extern char data_021a5d18[];

void func_0208a7c8(Obj_0208a7c8_t *a) {
    func_020927b8(data_021a5d18);
    if (data_021a5840 != 0) {
        func_020927b8((char *) data_021a5840 + 0x4c8);
    }

    if (a->field_110.bit1) {
        func_020882d4(a);
    }
    if (a->field_110.bit0) {
        a->field_16c(a);
    }

    func_0208a764(a);

    func_02092748(data_021a5d18);
    if (data_021a5840 != 0) {
        func_02092748((char *) data_021a5840 + 0x4c8);
    }
}
