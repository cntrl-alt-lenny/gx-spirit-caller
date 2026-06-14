; func_ov006_021c1cc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fb5c0
        .extern data_020fbe60
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_ov006_021c31d0
        .extern func_ov006_021c3384
        .extern func_ov006_021c4574
        .extern func_ov006_021c46c0
        .extern func_ov006_021c4768
        .global func_ov006_021c1cc0
        .arm
func_ov006_021c1cc0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x68]
    str r0, [r4, #0x6c]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_30
    ldr r0, _LIT0
    bl func_020211c8
    str r0, [r4, #0x8]
    bl func_0202147c
.L_30:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_48
    bl func_020212cc
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_48:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_60
    bl func_020212cc
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_60:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_7c
    ldr r0, _LIT1
    bl func_020211c8
    str r0, [r4]
    bl func_0202147c
.L_7c:
    mov r0, r4
    bl func_ov006_021c31d0
    mov r0, r4
    bl func_ov006_021c3384
    mov r0, r4
    bl func_ov006_021c4574
    mov r0, r4
    bl func_ov006_021c46c0
    mov r0, r4
    bl func_ov006_021c4768
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fb5c0
_LIT1: .word data_020fbe60
