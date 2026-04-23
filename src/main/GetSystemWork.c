/* GetSystemWork (was func_02018b28): rename-cascade pilot (brief 014).
 *
 * Returns the address of the arm9 main system state singleton at
 * `data_02104f58` — a 0x92c-byte BSS structure accessed by 189
 * callers across main for system-level state (flags, mode bits,
 * subsystem handles, per-frame counters). The satellites shipped
 * in earlier waves (#136, #145) decomp its offset-specific
 * getter/setter/bitfield wrappers; this match closes out the root
 * accessor itself.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     ldr r0, .L_02018b30           ; r0 = &data_02104f58
 *     bx  lr
 *   .L_02018b30: .word data_02104f58
 *
 * 2 ARM instructions + 1 literal-pool word, 0xc bytes.
 *
 * Naming: "SystemWork" follows Nintendo-era convention (Work = state
 * struct) and matches the role — a BSS singleton accessed by "get
 * pointer, read/write offset" code. The specific structure layout
 * isn't yet analyzed beyond what the offset-getter satellites
 * touched (roughly 0x800..0x920 contains flag/mode state), so the
 * name stays at the module-level granularity.
 *
 * Cascade signal: `find_cascades.py` predicts 23 callers promote
 * from hard → medium on this rename (plus the tier-promotions that
 * come from prior waves' satellite matches merging into the
 * placeholder → named chain). This is the pilot for the brief 014
 * rename-cascade workflow.
 *
 * Note: the data symbol `data_02104f58` is intentionally left as a
 * placeholder per brief 014 scope ("renames in overlays ... out of
 * scope; this brief ends at the one function rename"). Future briefs
 * can extend the rename to the struct + its fields.
 */

extern char data_02104f58[];

char *GetSystemWork(void) {
    return data_02104f58;
}
