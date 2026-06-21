; func_ov002_021f7f08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021d7c88
        .extern func_ov002_021de8fc
        .global func_ov002_021f7f08
        .arm
func_ov002_021f7f08:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT0
    ldr lr, [r2, #0x5b4]
    cmp lr, #0x0
    beq .L_724
    cmp lr, #0x1
    beq .L_768
    b .L_7ac
.L_724:
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov ip, r1, lsl #0x4
    mov r1, r3, lsl #0x1a
    add r1, ip, r1, lsr #0x1b
    mov r2, #0x1
    mvn r1, r2, lsl r1
    ldr r3, _LIT1
    mov r2, #0x0
    and r1, r1, r3, lsl ip
    bl func_ov002_021de8fc
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, pc}
.L_768:
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r3, r0, #0x1
    mul ip, r3, r1
    ldr r1, _LIT3
    ldr r1, [r1, ip]
    cmp r1, #0x0
    beq .L_79c
    mov r1, #0x0
    bl func_ov002_021d7c88
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_79c:
    add r0, lr, #0x1
    str r0, [r2, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_7ac:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000ffff
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
