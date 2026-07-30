extern int func_02030808(int a);
extern int func_0203058c(int a);
extern int func_ov002_021bb90c(int a, int b);
extern int func_02031838(int a);
extern int func_ov002_021ca3f0(int a, int b);

/* func_ov002_021ca440: guard chain (02030808/0203058c on arg1), then a
 * card-ID special-case dispatch: arg1 in {0x160f, 0x158b} takes the
 * L80 path, arg1 in [0x164a,0x164f] (a real 6-case switch in the
 * ground truth, all sharing one body) takes the L9c path, everything
 * else falls straight to the shared Lbc tail.
 */
int func_ov002_021ca440(int arg0, int arg1) {
    if (func_02030808(arg1) == 0) {
        return 0;
    }
    if (func_0203058c(arg1) != 0) {
        return 0;
    }

    if (arg1 > 0x160f) {
        goto check164a;
    }
    if (arg1 >= 0x160f) {
        goto L80;
    }
    if (arg1 != 0x158b) {
        goto Lbc;
    }
    goto L80;

check164a:
    switch (arg1) {
    case 0x164a:
    case 0x164b:
    case 0x164c:
    case 0x164d:
    case 0x164e:
    case 0x164f:
        goto L9c;
    default:
        goto Lbc;
    }

L80:
    if (func_ov002_021bb90c(arg0, arg1) == 0) {
        goto Lbc;
    }
    return 0;

L9c:
    {
        int v = func_02031838(arg1);
        if (func_ov002_021bb90c(arg0, v) == 0) {
            return 0;
        }
    }

Lbc:
    return func_ov002_021ca3f0(arg0, arg1) != 0;
}
