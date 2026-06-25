/* CAMPAIGN-PREP candidate for func_021ca0d4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two scalar early-outs; arg1!=KEY skip-guard blocks; bit22 bitfield; tail bool
 *   risk:       the `if(arg1!=K)` branch literal reused as the 021bae7c arg (cmp r4 then sub r1) may not CSE; literal-pool order; reg-alloc-walled
 *   confidence: low
 */
/* func_ov002_021ca0d4: two scalar early-outs (ce288+0x5c8 nonzero; bit22 of
 * cf288 word) then a chain of `if (arg1 != KEY) <guard>` blocks (skip the
 * guard when arg1 equals the key), then three 021bb068 + 021bae7c(1-p) +
 * tail chain. arg0=player(r5), arg1=key(r4). */
extern char data_ov002_022ce288[];
extern char data_ov002_022cf288[];
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);
extern int func_ov002_021b4098(int player, int kind, int code);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021ca0d4(int arg0, int arg1) {
    if (*(int *)(data_ov002_022ce288 + 0x5c8) != 0) return 0;
    if ((*(unsigned int *)((char *)data_ov002_022cf288 + (arg0 & 1) * 0x868) >> 22) & 1)
        return 0;
    if (arg1 != 0x13ff) {
        if (func_ov002_021bae7c(arg0, 0x13ff - 0x1400, -1) != 0) return 0;
    }
    if (arg1 != 0x12d2) {
        if (func_ov002_021b3ecc(arg0, 0xb, 0x12d2) != 0) return 0;
    }
    if (arg1 != 0x12de) {
        if (func_ov002_021b3ecc(arg0, 0xb, 0x12de) != 0) return 0;
    }
    if (arg1 != 0x1710) {
        if (func_ov002_021b3ecc(arg0, 0xb, 0x1710) != 0) return 0;
    }
    if (arg1 != 0x1973) {
        if (func_ov002_021b3ecc(arg0, 0xb, 0x1973) != 0) return 0;
    }
    if (func_ov002_021bb068(0x147f) != 0) return 0;
    if (func_ov002_021bb068(0x12b1) != 0) return 0;
    if (func_ov002_021bb068(0x1ae1) != 0) return 0;
    if (func_ov002_021bae7c(1 - arg0, 0x1ae8, -1) != 0) return 0;
    if (func_ov002_021b4098(arg0, 0xb, 0x15ad) != 0) return 0;
    if (func_ov002_021b3fd8(arg0, 0xb, 0x1679, 1) != 0) return 0;
    return func_ov002_021b3ecc(arg0, 0xb, 0x1a29) == 0;
}
