/* CAMPAIGN-PREP candidate for func_021b6dac (ov006, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch + single-base cond-adds; byte load
 *   risk:       Case 0 mwcc folds 0x198+0x9800=0x9998 then re-splits to different constants than 0x198/0x9800.
 *   confidence: med
 */
/* func_ov006_021b6dac: same jump-table base-select but a SINGLE pointer reg.
 * switch(sel) accumulates offsets into p, default leaves p = base (the addls-
 * pc default is reachable with p unmodified). Final load is a BYTE at
 * +(idx*4 + 2). Case 0 is two adds to the same reg (0x198 then 0x9800) —
 * 0x9998 is not a rotated immediate so it stays split; written as two summands
 * to bias mwcc toward that split. */

unsigned char func_ov006_021b6dac(char *p, int sel, int idx, int flag) {
    switch (sel) {
    case 0:
        p = p + 0x198 + 0x9800;
        break;
    case 1:
        if (flag) p = p + 0x158 + 0xb400;
        else      p = p + 0x358 + 0xb000;
        break;
    case 2:
        if (flag) p += 0x358;
        else      p += 0x158;
        p += 0xb800;
        break;
    case 3:
        if (flag) p = p + 0x158 + 0xc000;
        else      p = p + 0x358 + 0xbc00;
        break;
    case 4:
        if (flag) p = p + 0x158 + 0xc400;
        else      p = p + 0x58  + 0xc400;
        break;
    }
    return *(unsigned char *)(p + idx * 4 + 2);
}
