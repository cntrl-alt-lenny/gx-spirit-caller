; func_ov002_0226ce60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .global func_ov002_0226ce60
        .arm
func_ov002_0226ce60:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    rsb ip, r0, #0x1
    ldr r1, _LIT1
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT3
    ldr r1, [r1, #0xd9c]
    cmp r1, #0x0
    beq .L_620
    cmp r1, #0x1
    beq .L_640
    b .L_66c
.L_620:
    mov r1, #0xf9
    bl func_ov002_021ae320
    ldr r1, _LIT3
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, pc}
.L_640:
    mov r1, #0x2
    mov r0, ip
    sub r2, r1, #0x3
    mov r3, #0xd
    bl func_ov002_021af8f0
    ldr r1, _LIT3
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, pc}
.L_66c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd664
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022d008c
