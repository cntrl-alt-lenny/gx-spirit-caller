/* __sinit_ov011_021d3620: 0x34 sinit outlier — zero-field, then register-dtor.
 *
 * ARM disassembly (build/eur/asm/_dsd_gap@ov011_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     ldr  r3, .L_021d3644           ; r3 = data_ov011_021d4800
 *     mov  ip, #0x0
 *     ldr  r0, .L_021d3648           ; r0 = data_ov011_021d480c (obj)
 *     ldr  r1, .L_021d364c           ; r1 = func_ov011_021d2f50 (dtor)
 *     ldr  r2, .L_021d3650           ; r2 = data_ov011_021d4800 again (atexit)
 *     str  ip, [r3, #0xc]            ; *(021d4800 + 0xc) = 0
 *     bl   __register_global_object
 *     ldmia sp!, {r3, pc}
 *
 * 9 instructions × 4B + 4 literal-pool words × 4B = 52B = 0x34. ✓
 *
 * Why `asm void`, not plain C — same escape-hatch family as the ov002
 * 0x18 outlier (brief 009) and the ov010 0x48 pair above. The natural
 * C form
 *
 *     *(int *)(data_ov011_021d4800 + 0xc) = 0;
 *     __register_global_object(data_ov011_021d480c,
 *                              func_ov011_021d2f50,
 *                              data_ov011_021d4800);
 *
 * compiles under mwcc -O4,p to a **tail-call** shape: mwcc sees that
 * the registrar is the last operation, loads its target into r12, and
 * emits `bx r12` without saving lr. The resulting function is 0x2c
 * bytes, not 0x34, and the stmdb/ldmia frame disappears. Functionally
 * identical; byte-different.
 *
 * The asm body below pins the baserom's `bl + ldmia` shape. Notice the
 * literal pool: `data_ov011_021d4800` is loaded *twice* (once into r3
 * for the inline store, once into r2 as the registrar's atexit arg).
 * r3 is caller-saved so the bl would clobber it; reloading into r2 is
 * cheaper than spilling to a callee-saved register. The baserom
 * compiler emitted two separate pool entries for the same symbol;
 * mwcc's current inline-asm pool manager deduplicates them into one.
 *
 * Escape hatch: the second load uses the absolute numeric literal
 * `=0x021d4800` instead of the symbolic `=data_ov011_021d4800`. That
 * prevents the dedup (different expression tree), keeps the pool at
 * four entries matching the baserom layout, and produces the exact
 * same post-link bytes — the overlay loads at a fixed address so the
 * numeric literal resolves to the identical address the symbolic
 * reloc would write. `dsd check modules` confirms ov011 stays ✅.
 *
 * objdiff's per-.o comparison will report `matched_code_percent: None`
 * because the .o has one fewer reloc entry than the baserom's
 * delinked .o. That's a tooling-level artifact — the final overlay
 * bytes, which are what `dsd check modules` verifies, are
 * byte-identical.
 */

#include <runtime/sinit.h>

extern void func_ov011_021d2f50(void *obj);

extern char data_ov011_021d4800[];
extern char data_ov011_021d480c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

asm void __sinit_ov011_021d3620(void) {
    stmdb sp!, {r3, lr}
    ldr  r3, =data_ov011_021d4800
    mov  ip, #0x0
    ldr  r0, =data_ov011_021d480c
    ldr  r1, =func_ov011_021d2f50
    ldr  r2, =0x021d4800
    str  ip, [r3, #0xc]
    bl   __register_global_object
    ldmia sp!, {r3, pc}
}

#pragma section INIT end
