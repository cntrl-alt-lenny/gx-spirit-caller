; func_ov002_021f1248 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1d64
        .global func_ov002_021f1248
        .arm
func_ov002_021f1248:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    and r4, r1, #0x1
    mov ip, #0x14
    mul r3, r4, r3
    ldr lr, _LIT1
    mul ip, r2, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    cmp r2, #0x5
    mov lr, lr, lsl #0x13
    mov r4, lr, lsr #0x13
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh lr, [r0, #0x2]
    mov lr, lr, lsl #0x1f
    mov lr, lr, lsr #0x1f
    rsb lr, lr, #0x1
    cmp r1, lr
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr lr, _LIT2
    add lr, lr, r3
    ldrh lr, [ip, lr]
    cmp lr, #0x0
    bne .L_15c
    ldr lr, _LIT3
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_15c:
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
