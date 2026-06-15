; func_ov006_021c6d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fda40
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_0202227c
        .extern func_ov006_021c6e40
        .extern func_ov006_021c6fa0
        .extern func_ov006_021c6ff8
        .extern func_ov006_021c7110
        .extern func_ov006_021c71e0
        .extern func_ov006_021c72c8
        .extern func_ov006_021c74e0
        .global func_ov006_021c6d8c
        .arm
func_ov006_021c6d8c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x3c]
    cmp r1, #0x0
    beq .L_198
    bl func_ov006_021c6ff8
    mov r0, r4
    bl func_ov006_021c7110
    mov r0, r4
    bl func_ov006_021c72c8
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021c71e0
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021c6fa0
    mov r0, r4
    bl func_ov006_021c74e0
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_188
    ldr r0, _LIT0
    bl func_020211c8
    str r0, [r4]
    bl func_0202147c
    ldr r1, [r4, #0x38]
    mov r0, r4
    mov r2, #0x1
    bl func_ov006_021c6e40
.L_188:
    add r1, r4, #0x58
    mov r0, #0x0
    bl func_0202227c
    b .L_1bc
.L_198:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1b0
    bl func_020212cc
    mov r0, #0x0
    str r0, [r4]
.L_1b0:
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021c6fa0
.L_1bc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fda40
