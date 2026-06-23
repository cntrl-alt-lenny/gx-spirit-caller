; func_ov006_021c688c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_020221e0
        .extern func_020221f8
        .extern func_0202cc38
        .extern func_0202cc50
        .extern func_0202cda4
        .extern func_0202cdd0
        .extern func_0202d94c
        .global func_ov006_021c688c
        .arm
func_ov006_021c688c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_98
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_4c
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_40
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x0
.L_40:
    bl func_0202cc38
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_4c:
    ldr r0, [r4, #0x4]
    bl func_0202cc50
    bl func_0202cda4
    cmp r0, #0x0
    beq .L_74
    ldr r0, _LIT0
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    beq .L_74
    bl func_0202cdd0
.L_74:
    bl func_0202d94c
    mov r0, #0x0
    bl func_020221f8
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    orrne r1, r0, #0x4
    biceq r1, r0, #0x4
    mov r0, #0x0
    bl func_020221e0
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104acc
