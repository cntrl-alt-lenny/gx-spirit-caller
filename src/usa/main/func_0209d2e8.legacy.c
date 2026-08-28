/* func_0209d2e8: never-returning dispatch loop on data_021a83e0.
 * Waits (via func_020919a4(0), spinning) until field_114 bit3 is
 * set, then calls the function pointer at field_40 with &data as
 * arg, forever. No epilogue in the target -- infinite loop, matches
 * a bare for(;;). */

typedef struct {
    char pad_0[0x40];
    void (*field_40)(void *self);
    int field_44;
    char pad_48[0x104 - 0x48];
    void *field_104;
    char pad_108[0x114 - 0x108];
    int field_114;
} Data_021a84c0_t;

extern Data_021a84c0_t data_021a83e0;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_020919a4(int a0);

void func_0209d2e8(void) {
    Data_021a84c0_t *p = &data_021a83e0;

    for (;;) {
        int saved = OS_DisableIrq();

        if (!(p->field_114 & 8)) {
            do {
                p->field_104 = &p->field_44;
                func_020919a4(0);
            } while (!(p->field_114 & 8));
        }

        OS_RestoreIrq(saved);
        p->field_40(p);
    }
}
