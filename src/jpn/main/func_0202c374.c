/* CAMPAIGN-PREP candidate for func_0202c374 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     3x guard+Task_InvokeLocked+clear via .p1, reload-per-use
 *   risk:       global reload each use (ldr;ldr[#4];ldr) must reproduce; matched sibling func_0202c158 validates the shape
 *   confidence: high
 */
/* func_0202c374: three null-check Task_InvokeLocked + clear blocks on
 * data_0219a85c.p1->{slot0@0, slot1@4, slot2@8}. Reloads the global each
 * use; last block uses predicated early-return (ldmeqia). */

extern void Task_InvokeLocked(void *p);

typedef struct Slots0202c3c8 {
    void *s0;            /* +0x0 */
    void *s4;            /* +0x4 */
    void *s8;            /* +0x8 */
} Slots0202c3c8;

typedef struct Ctx0202c3c8 {
    char            _pad_00[0x4];
    Slots0202c3c8  *p1;  /* +0x4 */
} Ctx0202c3c8;

extern Ctx0202c3c8 data_0219a85c;

void func_0202c374(void) {
    if (data_0219a85c.p1->s0 != 0) {
        Task_InvokeLocked(data_0219a85c.p1->s0);
        data_0219a85c.p1->s0 = 0;
    }
    if (data_0219a85c.p1->s4 != 0) {
        Task_InvokeLocked(data_0219a85c.p1->s4);
        data_0219a85c.p1->s4 = 0;
    }
    if (data_0219a85c.p1->s8 != 0) {
        Task_InvokeLocked(data_0219a85c.p1->s8);
        data_0219a85c.p1->s8 = 0;
    }
}
