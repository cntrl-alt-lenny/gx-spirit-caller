/* func_0203a88c: optionally clear a linked owner-back-pointer, then under
 * IRQ-disable run the two per-frame updates (func_0207cf0c,
 * func_02038c48 — my own func_02038c48.c) and notify func_02088f20
 * unless the packed 4-bit state (f14 bits 20-23) is one of 3 special
 * values. */
typedef struct Obj0203a8dc {
    char         pad_8[0x8];
    void        *f8;   /* +0x8 */
    char         pad_14[0x14 - 0xc];
    unsigned int f14;  /* +0x14 */
} Obj0203a8dc;

extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern void  func_0207cf0c(void *a0, void *a1);
extern int   func_02038c48(void *obj, int flag);
extern void  func_02088f20(int a0, int a1);
extern char  data_0219c3b4[];

void func_0203a88c(Obj0203a8dc *obj) {
    if (obj->f8 != 0) {
        *(int *)((char *)obj->f8 + 4) = 0;
        obj->f8 = 0;
    }
    int field;
    unsigned int f14;
    int saved;
    saved = OS_DisableIrq();
    f14 = obj->f14;
    field = (f14 >> 20) & 0xf;
    func_0207cf0c(data_0219c3b4, obj);
    func_02038c48(obj, 1);
    if (!(field == 0xc || field == 0xd || field == 0x6)) {
        func_02088f20(f14, 0);
    }
    OS_RestoreIrq(saved);
}
