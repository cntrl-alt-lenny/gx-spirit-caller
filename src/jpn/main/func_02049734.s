; func_02049734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff880
        .extern data_020ff884
        .extern func_02045a74
        .extern func_02048880
        .extern func_020aad04
        .extern func_020acbac
        .global func_02049734
        .arm
func_02049734:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x218
    mov r6, r1
    add r1, sp, #0x4
    mov r4, r2
    mov r5, r3
    bl func_02048880
    cmp r0, #0x0
    beq .L_f0
    ldr r0, [sp, #0x8]
    cmp r0, #0x6
    bne .L_b4
    cmp r6, #0x0
    beq .L_70
    ldr r0, _LIT0
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045a74
    cmp r0, #0x0
    movle r0, #0x0
    strleb r0, [r6]
    ble .L_70
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
    strb r0, [r6]
.L_70:
    cmp r4, #0x0
    beq .L_cc
    ldr r0, _LIT1
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045a74
    cmp r0, #0x0
    movle r0, #0x0
    strleb r0, [r4]
    ble .L_cc
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
    strb r0, [r4]
    b .L_cc
.L_b4:
    cmp r6, #0x0
    movne r0, #0x0
    strneb r0, [r6]
    cmp r4, #0x0
    movne r0, #0x0
    strneb r0, [r4]
.L_cc:
    cmp r5, #0x0
    beq .L_e0
    add r1, sp, #0x10c
    mov r0, r5
    bl func_020aad04
.L_e0:
    ldr r0, [sp, #0x8]
    add sp, sp, #0x218
    and r0, r0, #0xff
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    cmp r6, #0x0
    movne r0, #0x0
    strneb r0, [r6]
    cmp r4, #0x0
    movne r0, #0x0
    strneb r0, [r4]
    mov r0, #0x0
    add sp, sp, #0x218
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ff880
_LIT1: .word data_020ff884
