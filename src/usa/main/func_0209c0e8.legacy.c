/* func_0209c0e8: release-side of a refcounted resource in
 * data_021a83e0 (see func_0209c280.legacy.c for the acquire-side
 * sibling, and func_0209cae4.legacy.c / func_0209d1f0.legacy.c for
 * other data_021a83e0 field usages). If the caller doesn't own the
 * resource (field_8 != a0) or the refcount is already 0, just runs
 * the notify helper. Otherwise notifies on an id mismatch, decrements
 * the refcount, and on reaching 0 marks the resource free (-3) and
 * clears field_18. Unconditionally zeroes *field_0 and restores irq. */

typedef struct {
    int *field_0;
    char pad_4[4];
    int field_8;
    int field_c;
    char field_10[8];
    int field_18;
} Data_021a84c0_t;

extern Data_021a84c0_t data_021a83e0;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02093b08(void);
extern void func_02091924(void *p, int v);

void func_0209c0e8(int a0, int a1) {
    Data_021a84c0_t *p = &data_021a83e0;
    int saved = OS_DisableIrq();

    if (p->field_8 != a0 || p->field_c == 0) {
        func_02093b08();
    } else {
        if (p->field_18 != a1) {
            func_02093b08();
        }
        p->field_c -= 1;
        if (p->field_c == 0) {
            p->field_8 = ~2;
            p->field_18 = 0;
            func_02091924(&p->field_10, 0);
        }
    }

    *p->field_0 = 0;
    OS_RestoreIrq(saved);
}
