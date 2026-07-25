/* func_ov002_022bda34: for each of 16 (field0,field4) pairs (stride 8), if
 * field0 is set and func_02021584(field0) returns 0, clear both fields. */

extern int func_02021584(void *p);

typedef struct {
    int field0;
    int field4;
} Pair;

void func_ov002_022bda34(Pair *arr) {
    int i;
    for (i = 0; i < 0x10; i++, arr++) {
        if (arr->field0 != 0) {
            if (func_02021584((void *)arr->field0) == 0) {
                arr->field0 = 0;
                arr->field4 = 0;
            }
        }
    }
}
