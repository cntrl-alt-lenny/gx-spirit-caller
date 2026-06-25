/* CAMPAIGN-PREP candidate for func_02027048 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted-loop + null-guard tail-call + STORE-ORDER MMIO reset
 *   risk:       hand-.s has TWO literals (reloc + bare 0x0219a924 anti-trim); C emits one -> literal-pool/reloc differs
 *   confidence: low
 */
/* func_02027048 — counted loop over entries + invoke + clear + MMIO reset */
typedef unsigned short u16;

typedef struct Entry {
    int active;            /* 0x00 — guarded != 0 */
    char _pad[0xe0 - 4];   /* pad to 0xe0 stride */
} Entry;                   /* sizeof = 0xe0 */

typedef struct Mgr {
    Entry *entries;        /* 0x00 — array base; also passed to Task_InvokeLocked then nulled */
    int    count;          /* 0x04 */
} Mgr;

extern Mgr data_0219a924;
extern void func_02027144(Entry *e);
extern void Task_InvokeLocked(Entry *e);

int func_02027048(void) {
    int i;
    for (i = 0; i < data_0219a924.count; i++) {
        if (data_0219a924.entries[i].active)
            func_02027144(&data_0219a924.entries[i]);
    }
    if (data_0219a924.entries) {
        Task_InvokeLocked(data_0219a924.entries);
        data_0219a924.entries = 0;
    }
    *(volatile u16 *)0x05000000 = 0;
    *(volatile u16 *)0x05000400 = 0;
    return 1;
}
