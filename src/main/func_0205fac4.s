; func_0205fac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100e20
        .extern func_020453e8
        .extern func_0205ffc0
        .extern func_020a73d4
        .global func_0205fac4
        .arm
func_0205fac4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r0, #0x144
    mov r5, r1
    mov r7, r2
    bl func_020453e8
    movs r4, r0
    bne .L_20b8
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_20b8:
    mov r1, #0x0
    mov r2, #0x144
    bl func_020a73d4
    str r7, [r4]
    mvn r0, #0x0
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    str r0, [r4, #0xc]
    str r0, [r4, #0x20]
    str r0, [r4, #0x24]
    mov r0, #0x1000
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    bl func_020453e8
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x13c]
    strne r0, [r4, #0x140]
    addne sp, sp, #0x4
    strne r4, [r5]
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ffc0
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100e20
