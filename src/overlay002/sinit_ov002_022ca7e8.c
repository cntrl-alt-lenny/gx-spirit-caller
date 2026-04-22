/* __sinit_ov002_022ca7e8: 0x18-byte sinit outlier deferred from
 * brief 003. Not the standard register-global-object template — just
 * stores the address of one data symbol into a slot 0x1f8 bytes into
 * another data symbol, then returns.
 *
 * ARM disassembly (from build/disasm/_dsd_gap@ov002_5.s):
 *
 *     .section .init, 4, 1, 4
 *     __sinit_ov002_022ca7e8:                 ; 0x022ca7e8
 *         ldr r0, .L_022ca7f8                 ; r0 = &data_ov002_022d11bc
 *         ldr r1, .L_022ca7fc                 ; r1 = &data_ov002_022cc4f4
 *         str r1, [r0, #0x1f8]                ; *(r0 + 0x1f8) = r1
 *         bx  lr
 *     .L_022ca7f8: .word data_ov002_022d11bc
 *     .L_022ca7fc: .word data_ov002_022cc4f4
 *
 * 4 instructions × 4B + 2 literal-pool words × 4B = 24B = 0x18. ✓
 *
 * Why `asm void`, not plain C — the brief's literal-pool risk note in
 * action. The natural C form
 *
 *     *(char **)(data_ov002_022d11bc + 0x1f8) = data_ov002_022cc4f4;
 *
 * compiles under mwcc -O4,p to logically identical but byte-different
 * code: r1 is loaded *first* (source), r0 is loaded *second*
 * (destination), and the literal pool comes out [022cc4f4, 022d11bc]
 * — opposite of the baserom's [022d11bc, 022cc4f4]. mwcc's evaluation
 * order for `*lhs = rhs;` where both sides are address-of-global is
 * fixed at RHS-first regardless of the C dressing — I tried the four
 * variants the brief hinted at (plain assign, intermediate `slot`
 * temp, `volatile char **` temp, `*(unsigned int *)(...) = (unsigned
 * int)...`), plus a struct-member access and swapping the extern
 * declaration order. All produced the same RHS-first byte pattern.
 *
 * Inline asm via mwcc's `asm void` keyword is the only form that
 * pins the load order. The body below is one-to-one with the four
 * baserom instructions; mwcc/mwldarm handles the literal-pool layout
 * and relocations exactly the same way they would for a plain `bl`
 * or `ldr =sym` reference. Result: 24/24 byte match against the
 * baserom .init bytes.
 *
 * Symbols kept as `data_ov002_*` placeholders per brief 009 — the role
 * of the structure at +0x1f8 isn't identified yet.
 */

extern char data_ov002_022d11bc[];   /* bss, destination structure */
extern char data_ov002_022cc4f4[];   /* data, pointer being installed */

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

asm void __sinit_ov002_022ca7e8(void) {
    ldr  r0, =data_ov002_022d11bc
    ldr  r1, =data_ov002_022cc4f4
    str  r1, [r0, #0x1f8]
    bx   lr
}

#pragma section INIT end
