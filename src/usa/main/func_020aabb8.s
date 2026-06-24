; func_020aabb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern data_021a9f60
        .extern data_021a9f84
        .extern data_021aa050
        .extern data_021aa384
        .extern func_020925a4
        .extern func_02092660
        .extern func_020926d0
        .extern func_020a6a60
        .global func_020aabb8
        .arm
func_020aabb8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r5, #0x1
    blt .L_18
    cmp r5, #0x7
    ble .L_20
.L_18:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_20:
    ldr r0, _LIT0
    bl func_020925a4
    cmp r0, #0x0
    bne .L_54
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0x1c]
    str r2, [r0, #0x1c]
    b .L_ac
.L_54:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x1c]
    ldr r0, [r0, #0x6c]
    cmp r1, r0
    bne .L_84
    ldr r0, _LIT3
    ldr r1, [r0, #0x1c]
    add r1, r1, #0x1
    str r1, [r0, #0x1c]
    b .L_ac
.L_84:
    ldr r0, _LIT0
    bl func_020926d0
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0x1c]
    str r2, [r0, #0x1c]
.L_ac:
    ldr r1, _LIT4
    sub r2, r5, #0x1
    ldr r4, [r1, r2, lsl #0x2]
    cmp r4, #0x1
    movne r0, #0x0
    strne r0, [r1, r2, lsl #0x2]
    ldr r0, _LIT3
    ldr r1, [r0, #0x1c]
    subs r1, r1, #0x1
    str r1, [r0, #0x1c]
    bne .L_e0
    ldr r0, _LIT0
    bl func_02092660
.L_e0:
    cmp r4, #0x1
    beq .L_f4
    cmp r4, #0x0
    cmpeq r5, #0x1
    bne .L_fc
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_fc:
    cmp r4, #0x0
    bne .L_10c
    mov r0, #0x0
    bl func_020a6a60
.L_10c:
    mov r0, r5
    blx r4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_021aa050
_LIT1: .word data_021a62f0
_LIT2: .word data_021a9f60
_LIT3: .word data_021a9f84
_LIT4: .word data_021aa384
