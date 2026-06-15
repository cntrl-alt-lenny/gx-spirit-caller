; func_ov006_021c6998 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern func_02022234
        .extern func_0202224c
        .extern func_0202cc8c
        .extern func_0202cca4
        .extern func_0202cdf8
        .extern func_0202ce24
        .extern func_0202d9a0
        .global func_ov006_021c6998
        .arm
func_ov006_021c6998:
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
    bl func_0202cc8c
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_4c:
    ldr r0, [r4, #0x4]
    bl func_0202cca4
    bl func_0202cdf8
    cmp r0, #0x0
    beq .L_74
    ldr r0, _LIT0
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    beq .L_74
    bl func_0202ce24
.L_74:
    bl func_0202d9a0
    mov r0, #0x0
    bl func_0202224c
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    orrne r1, r0, #0x4
    biceq r1, r0, #0x4
    mov r0, #0x0
    bl func_02022234
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104bac
