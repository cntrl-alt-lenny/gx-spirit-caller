; func_ov006_021b5b70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f38c
        .extern data_ov006_0224f398
        .extern data_ov006_0225e068
        .extern func_02008888
        .extern func_ov006_021ca264
        .extern func_ov006_021ca3e0
        .extern func_ov006_021ca3f0
        .global func_ov006_021b5b70
        .arm
func_ov006_021b5b70:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    add r5, sp, #0x0
    ldr r0, _LIT0
    mov r1, r5
    mov r2, #0x8
    ldr r4, _LIT1
    bl Copy32
    ldr r1, [sp]
    ldr r0, _LIT2
    mov r2, #0x0
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    cmp r1, #0x0
    beq .L_1b8
    cmp r1, #0x1
    beq .L_16c
    cmp r1, #0x2
    beq .L_188
    b .L_1b8
.L_16c:
    mov r0, r4
    mov r1, #0x19
    bl func_ov006_021ca264
    bl func_02008888
    ldr r1, _LIT2
    str r0, [r1, #0x14]
    b .L_1b8
.L_188:
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x1
    bl func_ov006_021ca3e0
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x2
    bl func_ov006_021ca3f0
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r2, #0x0
    bl func_ov006_021ca264
.L_1b8:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0224f398
_LIT1: .word data_ov006_0225e068
_LIT2: .word data_ov006_0224f38c
