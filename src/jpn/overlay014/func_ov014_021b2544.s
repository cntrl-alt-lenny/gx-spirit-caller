; func_ov014_021b2544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov014_021b4f40
        .extern data_ov014_021b4f88
        .extern data_ov014_02234f94
        .extern data_ov014_02234ff4
        .extern func_02001b84
        .extern func_02005c44
        .extern func_020068fc
        .extern func_0202aeec
        .extern func_0202c158
        .extern func_ov005_021acf28
        .extern func_ov014_021b270c
        .extern func_ov014_021b3ec4
        .global func_ov014_021b2544
        .arm
func_ov014_021b2544:
    stmdb sp!, {r3, lr}
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r1]
    ldr r1, [r2]
    ldr r0, _LIT0
    bic r1, r1, #0x1f00
    str r1, [r2]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_44
    ldr r0, _LIT1
    bl func_ov014_021b270c
    ldr r0, _LIT2
    bl func_ov014_021b3ec4
.L_44:
    mov r0, #0x2
    bl func_02005c44
    mov r0, #0x1
    bl func_02005c44
    bl func_02001b84
    ldr r0, _LIT1
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    beq .L_84
    ldr r0, _LIT3
    mov r1, #0x80000
    bl func_ov005_021acf28
    ldr r0, _LIT0
    mov r1, #0x3
    str r1, [r0]
    b .L_90
.L_84:
    bl func_0202c158
    bl func_0202aeec
    bl func_020068fc
.L_90:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov014_021b4f40
_LIT1: .word data_ov014_02234f94
_LIT2: .word data_ov014_02234ff4
_LIT3: .word data_ov014_021b4f88
