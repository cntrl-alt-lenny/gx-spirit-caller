/* func_ov006_021bdcdc: Ov006Slot state refresh (self+0xa0, stride 0x24,
 * indexed by self->0x50). If the slot's `fc` bound is unset, toggle the
 * slot's flag bit and zero its f0/f4/f8 fields. Otherwise re-evaluate the
 * slot via func_ov006_021bd6bc, look up a target via func_ov006_021b6d1c,
 * toggle the flag bit, notify via func_ov006_021be5b8, resolve an index via
 * func_ov006_021b6e3c, and commit via func_ov006_021bd700.
 */
typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int pad14;
    int pad18;
    int pad1c;
    unsigned flag : 1;
    unsigned : 31;
} Ov006Slot;

extern char data_ov006_0224f448[];
extern int  func_ov006_021bd6bc(char *obj, int sel);
extern unsigned short func_ov006_021b6d1c(char *p, int sel, int idx, int flag);
extern int  func_ov006_021b6e3c(void *base_, int idx, int target, int flag);
extern void func_ov006_021be5b8(void *self);
extern void func_ov006_021bd700(void *self, int sel, int idx);

int func_ov006_021bdcdc(char *self) {
    char *f448 = data_ov006_0224f448;
    Ov006Slot *slot = (Ov006Slot *)(self + 0xa0) + *(int *)(self + 0x50);

    if (slot->fc == 0) {
        slot->flag = !slot->flag;
        slot->f0 = 0;
        slot->f4 = 0;
        slot->f8 = 0;
    } else {
        int v = func_ov006_021bd6bc(self, *(int *)(self + 0x50));
        int idx = (v < 0) ? (slot->fc - 1) : v;
        int target = func_ov006_021b6d1c(f448, *(int *)(self + 0x50), idx, slot->flag);

        slot->flag = !slot->flag;
        func_ov006_021be5b8(self);

        {
            int idx2 = func_ov006_021b6e3c(f448, *(int *)(self + 0x50), target, slot->flag);
            func_ov006_021bd700(self, *(int *)(self + 0x50), idx2);
        }
    }
    return 1;
}
