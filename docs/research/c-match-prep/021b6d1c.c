/* CAMPAIGN-PREP candidate for func_021b6d1c (ov006, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch + uninitialised-var default + cond-adds
 *   risk:       Default-path uninitialised p1 may not reuse the sel reg; mwcc could emit a real jump table block vs addls-pc.
 *   confidence: med
 */
/* func_ov006_021b6d1c: jump-table base-select returning a u16. switch(sel)
 * over cases 0..4 (cmp #4; addls pc), each picks a sub-base p0 then a far
 * pointer p1 = p0 + bigOffset (flag-dependent), and returns *(u16*)(p1 +
 * idx*4). DEFAULT path leaves p1 UNINITIALISED (asm uses the original sel
 * register as the pointer) — intentional, matches the uninitialised-switch-
 * var recipe. p0 and p1 are distinct regs so the per-case adds stay split. */

unsigned short func_ov006_021b6d1c(char *base, int sel, int idx, int flag) {
    char *p0 = base;
    char *p1;
    switch (sel) {
    case 0:
        p0 = base + 0x198;
        p1 = p0 + 0x9800;
        break;
    case 1:
        if (flag) { p0 = base + 0x158; p1 = p0 + 0xb400; }
        else      { p0 = base + 0x358; p1 = p0 + 0xb000; }
        break;
    case 2:
        if (flag) p0 = base + 0x358;
        else      p0 = base + 0x158;
        p1 = p0 + 0xb800;
        break;
    case 3:
        if (flag) { p0 = base + 0x158; p1 = p0 + 0xc000; }
        else      { p0 = base + 0x358; p1 = p0 + 0xbc00; }
        break;
    case 4:
        if (flag) { p0 = base + 0x158; p1 = p0 + 0xc400; }
        else      { p0 = base + 0x58;  p1 = p0 + 0xc400; }
        break;
    }
    return *(unsigned short *)(p1 + idx * 4);
}
