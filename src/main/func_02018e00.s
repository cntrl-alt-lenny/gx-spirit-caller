; func_02018e00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019210
        .global func_02018e00
        .arm
func_02018e00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl GetSystemWork
    mov r4, r0
    mov r0, r6
    bl func_02019210
    sub r1, r0, #0x1
    mov r0, #0x18
    mla r2, r1, r0, r4
    ldr r1, [r2, #0x10]
    and r0, r5, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r2, #0x10]
    ldmia sp!, {r4, r5, r6, pc}
