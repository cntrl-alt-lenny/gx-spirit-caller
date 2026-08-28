/* func_0206bf20: look up a slot via func_0206bf68(a2) and populate it from
 * (a0, a1, a2). Shared "handle" struct family also touched by func_0206bdf0
 * (field_8/field_d) and func_0206c7d8 (field_0x10.. via a different caller).
 */

typedef struct {
    void *field_0;
    void *field_4;
    void *field_8;
    signed char field_c;
    unsigned char field_d;
} Obj_0206bf94_t;

extern Obj_0206bf94_t *func_0206bf68(int a0);

Obj_0206bf94_t *func_0206bf20(void *a0, char *a1, int a2) {
    Obj_0206bf94_t *result = func_0206bf68(a2);
    if (result == 0) {
        return result;
    }
    result->field_0 = a0;
    result->field_4 = a1;
    result->field_8 = 0;
    result->field_c = *(signed char *)(a1 + 0x73);
    result->field_d = (unsigned char)a2;
    return result;
}
