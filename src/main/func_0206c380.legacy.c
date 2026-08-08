/* func_0206c380: critsec'd indirect call through data_0219ecd8's vtable
 * (field_18), then dispatch cleanup calls on the result if non-null.
 */

typedef void *(*Cb0x18_t)(void *);

typedef struct {
    unsigned char _pad_00[0x18];
    Cb0x18_t field_18;
} Vt_0206c380_t;

extern Vt_0206c380_t *data_0219ecd8;
extern void *func_0206c2f4(void *param0);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020945f4(void *a, int b, void *c);
extern void func_0206c1b4(void *a, void *b);
extern void func_0206e590(void *a);

void *func_0206c380(void *param0) {
    void *r4 = func_0206c2f4(param0);
    void *r6;
    int irq = OS_DisableIrq();
    r6 = data_0219ecd8->field_18(r4);
    if (r6 != 0) {
        func_020945f4(r6, 0, r4);
        func_0206c1b4(r6, param0);
        func_0206e590(r6);
    }
    OS_RestoreIrq(irq);
    return r6;
}
