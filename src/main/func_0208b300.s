; func_0208b300 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208b300
        .arm
func_0208b300:
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    ldmia r0, {r2, r3, r4, r5, r6, r7, r8, r9, ip}
    stmia r1!, {r2, r5, r8}
    stmia r1!, {r3, r6, r9}
    stmia r1!, {r4, r7, ip}
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    str r0, [r1, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
