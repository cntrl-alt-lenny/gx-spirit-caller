/* func_ov006_021ba0f0: dispatcher on self->0x38 (switch, sketch in
 * ov006_core.h). state 0 -> init sub-object once sub-state hits 3; state 1 ->
 * probe via func_ov006_021ba364, advance to state 2 on success; state 2 ->
 * early-return 1. Shared tail rebuilds a flags word for func_02022234 from
 * data_ov006_0225e100+8 and conditionally advances self->0x68 by
 * data_021040ac+0x30.
 */
extern int func_0202224c(int a);
extern void func_ov006_021ba1f8(void *self);
extern int func_ov006_021ba364(void *self);
extern void func_02022234(int a, int b);
extern char data_ov006_0225e100[];
extern char data_021040ac[];

int func_ov006_021ba0f0(void *selfv) {
    char *self = (char *)selfv;
    int flags = func_0202224c(0);
    int state = *(int *)(self + 0x38);

    switch (state) {
    case 0:
        if (*(int *)(self + 0x3c) == 3) {
            func_ov006_021ba1f8(selfv);
            *(int *)(self + 0x38) = 1;
            *(int *)(self + 0x3c) = 0;
        }
        break;
    case 1:
        if (*(int *)(self + 0x3c) == 0xf) {
            *(int *)(self + 0x7c) = 1;
        }
        if (func_ov006_021ba364(selfv) != 0) {
            *(int *)(self + 0x38) = 2;
            *(int *)(self + 0x3c) = 0;
            flags |= 1;
        }
        break;
    case 2:
        return 1;
    }

    if (*(int *)(data_ov006_0225e100 + 8) != 0) {
        flags |= 2;
    } else {
        flags &= ~2;
    }
    func_02022234(0, flags);

    if (*(int *)(self + 0x74) != 0 && *(int *)(self + 0x7c) != 0) {
        *(int *)(self + 0x68) += *(int *)(data_021040ac + 0x30);
    }
    *(int *)(self + 0x3c) += 1;
    return 0;
}
