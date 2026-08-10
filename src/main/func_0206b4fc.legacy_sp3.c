/* func_0206b4fc: lookup-or-create cache entry. Build a probe key {a1,...} on
 * the stack, look it up via func_02068c08(a0)+func_0205442c(handle,&key); if
 * found, bump its refcount (f_4) and return its value (f_0); otherwise
 * compute a fresh value via func_020552dc(a1), register it via
 * func_02068c08(a0)+func_02054568(handle,&key) with refcount 1, and return
 * the fresh value.
 */

typedef struct {
    int f_0;
    int f_4;
    int f_8;
} key_t;

extern int func_02068c08(void *a0);
extern key_t *func_0205442c(int handle, key_t *key);
extern int func_020552dc(int a1);
extern void func_02054568(int handle, key_t *key);

int func_0206b4fc(void *a0, int a1) {
    key_t local;
    local.f_0 = a1;
    int handle = func_02068c08(a0);
    key_t *entry = func_0205442c(handle, &local);
    if (entry != 0) {
        entry->f_4 = entry->f_4 + 1;
        return entry->f_0;
    }
    local.f_0 = func_020552dc(a1);
    local.f_4 = 1;
    int handle2 = func_02068c08(a0);
    func_02054568(handle2, &local);
    return local.f_0;
}
