; func_0204b850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204d438
        .extern func_0204ead0
        .extern func_020930b0
        .global func_0204b850
        .arm
func_0204b850:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r1
    cmp r5, #0xd
    mov r6, r0
    movne r4, #0x0
    bne .L_7ac
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    mov r4, #0x1
    str r0, [sp, #0x8]
.L_7ac:
    add r0, sp, #0x8
    str r0, [sp]
    mov r2, #0x0
    mov r0, r5
    mov r1, r6
    mov r3, r2
    str r4, [sp, #0x4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1e8]
    str r1, [r4, #0x1ec]
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
