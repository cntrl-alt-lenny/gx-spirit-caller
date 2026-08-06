/* func_ov002_021f40f4: classifies *p (a u16 id) against several id-range
 * windows, returning 0/1/2. goto-mirrors the original branch structure
 * directly (leaf function, no stack frame).
 */

int func_ov002_021f40f4(unsigned short *p)
{
    int v = *p;

    if (v > 0x1661) goto L_ce8;
    if (v < 0x165f) goto L_cc4;
    switch (v) {
    case 0x165f:
    case 0x1661:
        goto L_d18;
    }
    goto L_d28;

L_cc4:
    if (v > 0x14ea) goto L_cd8;
    if (v != 0x14ea) goto L_d28;
    goto L_d20;

L_cd8:
    if (v != 0x15f1) goto L_d28;
    goto L_d18;

L_ce8:
    if (v > 0x198c) goto L_d08;
    if (v >= 0x198c) goto L_d18;
    if (v != 0x1907) goto L_d28;
    goto L_d20;

L_d08:
    if (v != 0x19af) goto L_d28;
    goto L_d20;

L_d18:
    return 1;
L_d20:
    return 2;
L_d28:
    return 0;
}
