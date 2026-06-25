; func_ov002_021b3414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .global func_ov002_021b3414
        .arm
func_ov002_021b3414:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    and lr, r0, #0x1
    mul r4, lr, ip
    mov r0, #0x14
    mul lr, r1, r0
    ldr ip, _LIT1
    add r0, ip, r4
    add r0, r0, lr
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    add r0, r0, r4
    ldrh r4, [lr, r0]
    cmp r4, #0x0
    beq .L_150
    ldr lr, _LIT3
.L_110:
    add r1, lr, r4, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r4, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcc .L_148
    ldrh r1, [r1]
    mov ip, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, r2
    and r1, ip, #0xff
    cmpeq r1, r3
    ldmeqia sp!, {r4, pc}
.L_148:
    cmp r4, #0x0
    bne .L_110
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c6
_LIT3: .word data_ov002_022d0570
