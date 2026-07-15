; func_02047830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc74
        .extern data_0219dc78
        .extern data_0219dc7c
        .extern func_02047830
        .extern func_02047c08
        .extern func_02047e88
        .extern func_02047fb8
        .extern func_02053024
        .extern func_0205337c
        .extern func_02055c04
        .extern func_02055c70
        .extern func_02055e28
        .extern func_020aaf40
        .global func_02047830
        .arm
func_02047830:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r4, r1
    ldr r1, [r4]
    mov r5, r0
    cmp r1, #0x0
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r1]
    ldr r1, [r2, #0x4]
    cmp r1, #0x3
    bne .L_dc
    ldrsb r1, [r4, #0x8e]
    cmp r1, #0x0
    bne .L_b4
    ldr r0, [r2, #0x1c]
    ldr r1, [r2, #0xc]
    add r2, sp, #0x8
    add r0, r0, #0x4
    bl func_0205337c
    ldr r1, _LIT1
    add r2, sp, #0x8
    mov r0, r5
    bl func_02055c04
    bl func_02047fb8
    cmp r0, #0x0
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT0
    mov r3, #0x4
    ldr r1, [r0]
    ldr r0, _LIT2
    str r3, [r1, #0x4]
    mov r2, #0x0
    str r0, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_02055c70
    bl func_02047fb8
    add sp, sp, #0x4c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_b4:
    bl func_02055e28
    ldr r0, _LIT3
    mov r1, #0x0
    bl func_02047c08
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    add sp, sp, #0x4c
    str r1, [r0, #0x4]
    ldmia sp!, {r4, r5, pc}
.L_dc:
    cmp r1, #0x4
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [r2, #0x1c]
    ldr r1, [r2, #0xc]
    add r2, sp, #0x1d
    add r0, r0, #0x4
    bl func_0205337c
    add r1, sp, #0x1d
    add r0, r4, #0x8e
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_174
    ldr r0, _LIT0
    add r2, sp, #0x32
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    add r0, r0, #0x3c
    bl func_0205337c
    ldr r0, _LIT0
    ldr r2, [r4, #0x4]
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r1, r1, #0x3c
    bl func_02053024
    mov r0, r5
    bl func_02055e28
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r4, [r0]
    ldr r0, _LIT5
    ldr r2, [r1]
    ldr r3, [r0]
    add r0, r4, #0x48
    add r1, r4, #0x148
    blx r3
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_174:
    ldr r0, _LIT2
    mov r2, #0x0
    str r0, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_02055c70
    bl func_02047fb8
    cmp r0, #0x0
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc78
_LIT1: .word 0x00000705
_LIT2: .word func_02047830
_LIT3: .word func_02047e88
_LIT4: .word data_0219dc74
_LIT5: .word data_0219dc7c
