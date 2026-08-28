/* func_0206b488: lookup-or-create cache entry. Build a probe key {a1,...} on
 * the stack, look it up via func_02068b94(a0)+func_020543b8(handle,&key); if
 * found, bump its refcount (f_4) and return its value (f_0); otherwise
 * compute a fresh value via func_02055268(a1), register it via
 * func_02068b94(a0)+func_020544f4(handle,&key) with refcount 1, and return
 * the fresh value.
 */

typedef struct {
    int f_0;
    int f_4;
    int f_8;
} key_t;

extern int func_02068b94(void *a0);
extern key_t *func_020543b8(int handle, key_t *key);
extern int func_02055268(int a1);
extern void func_020544f4(int handle, key_t *key);

int func_0206b488(void *a0, int a1) {
    key_t local;
    local.f_0 = a1;
    int handle = func_02068b94(a0);
    key_t *entry = func_020543b8(handle, &local);
    if (entry != 0) {
        entry->f_4 = entry->f_4 + 1;
        return entry->f_0;
    }
    local.f_0 = func_02055268(a1);
    local.f_4 = 1;
    int handle2 = func_02068b94(a0);
    func_020544f4(handle2, &local);
    return local.f_0;
}
