; func_02019604 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019210
        .global func_02019604
        .arm
func_02019604:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    mov r0, r5
    bl func_02019210
    sub r1, r0, #0x1
    mov r0, #0x18
    mla r2, r1, r0, r4
    ldrb r1, [r2, #0x14]
    ldrb r0, [r2, #0x15]
    ldrb r2, [r2, #0x16]
    add r0, r1, r0
    add r0, r2, r0
    ldmia sp!, {r3, r4, r5, pc}
