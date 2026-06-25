/* CAMPAIGN-PREP candidate for func_02029458 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed s16 accessor guard + mvn(-1) store + byte/halfword bic RMW + invoke-clear
 *   risk:       compiler may not hoist byte187 base (r4+0x87) above the blt; store scheduling; offsets guessed
 *   confidence: med
 */
/* func_02029458 — signed-halfword guard, clear-to-FF, byte+halfword bit-clear, invoke */
typedef short s16;
typedef unsigned short u16;
typedef unsigned char u8;

typedef struct Obj29458 {
    char _pad0[0x184];
    s16  h184;                  /* 0x184 — ldrsh, signed */
    u8   _pad1;                 /* 0x186 */
    u8   byte187;               /* 0x187 — &= ~1 */
    char _pad2[0x188 - 0x188];  /* (none) */
    int  field188;              /* 0x188 — != 0 guard, cleared */
    char _pad3[0x19a - 0x18c];  /* 0x18c .. 0x19a */
    u16  flags19a;              /* 0x19a — &= ~1 */
} Obj29458;

extern void func_02022580(int x);
extern void Task_InvokeLocked(int x);

int func_02029458(Obj29458 *p) {
    if (p->h184 >= 0) {
        func_02022580(p->h184);
        p->h184 = -1;
        p->byte187 &= ~1;
    }
    if (p->field188) {
        Task_InvokeLocked(p->field188);
        p->field188 = 0;
    }
    p->flags19a &= ~1;
    return 1;
}
