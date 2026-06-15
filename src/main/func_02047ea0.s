; func_02047ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff920
        .extern data_0219dc78
        .extern func_020468ec
        .extern func_02047830
        .extern func_02047fb8
        .extern func_020480b4
        .extern func_02049038
        .extern func_02051618
        .extern func_02055c70
        .global func_02047ea0
        .arm
func_02047ea0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov r2, #0x0
    ldr ip, [r3]
    mov r4, r1
    str r2, [ip, #0x30]
    ldr r1, [r4]
    cmp r1, #0x0
    bne .L_f8
    ldr ip, [r3]
    ldr r1, [ip, #0x4]
    cmp r1, #0x2
    bne .L_c4
    ldr r1, [ip, #0x1c]
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x1c]
    cmp r1, r0
    bne .L_b0
    ldr r1, _LIT1
    mov r3, #0x5
    mov r0, #0x1
    str r3, [ip, #0x4]
    bl func_02049038
    bl func_02047fb8
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, [r4, #0x4]
    ldr r3, [r0]
    mov r0, #0x0
    ldr r2, [r3, #0x18]
    ldr r3, [r3, #0x14]
    blx r3
    bl func_020468ec
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    bl func_02051618
    add sp, sp, #0x8
    cmp r0, #0x0
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_020480b4
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_c4:
    cmp r1, #0x3
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r3, r2
    str r1, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4, #0x4]
    bl func_02055c70
    bl func_02047fb8
    add sp, sp, #0x8
    cmp r0, #0x0
    ldmia sp!, {r4, pc}
.L_f8:
    mov r0, r1
    bl func_02047fb8
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc78
_LIT1: .word data_020ff920
_LIT2: .word 0xffff15a0
_LIT3: .word func_02047830
