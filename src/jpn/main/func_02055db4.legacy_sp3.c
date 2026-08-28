/* func_02055db4: bails out if obj is null, obj's field_0 pointer is
 * null, or field_0->field_0x108 is nonzero. Otherwise notifies
 * func_02058654(obj, 1) then func_02056520(obj).
 */
extern void func_02058654(void *a0, int a1);
extern void func_02056520(void *a0);

void func_02055db4(char *obj) {
    char *inner;

    if (obj == 0) return;

    inner = *(char **)obj;
    if (inner == 0) return;

    if (*(int *)(inner + 0x108) != 0) return;

    func_02058654(obj, 1);
    func_02056520(obj);
}
