typedef struct {
    char pad[0x14];
    int field_14;
} data_arg_t;

extern int func_0202b878(int val);
extern int func_ov002_0223f684(data_arg_t *a, int b);
extern int func_ov002_021ff400(data_arg_t *a, int b);
extern int func_ov002_0223fa20(data_arg_t *a, int b);

int func_ov002_02244284(data_arg_t *a, int b) {
    if (func_0202b878(a->field_14) == 0x16) {
        return 1;
    }
    if (func_0202b878(a->field_14) == 0x17) {
        return func_ov002_0223f684(a, b);
    }
    if (func_ov002_021ff400(a, b) == 0) {
        return 1;
    }
    return func_ov002_0223fa20(a, b);
}
