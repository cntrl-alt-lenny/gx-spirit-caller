; func_ov002_021f1dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c2084
        .global func_ov002_021f1dc8
        .arm
func_ov002_021f1dc8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    ldr r6, _LIT0
    and r7, r5, #0x1
    mul ip, r7, r6
    mov r4, r2
    mov r3, #0x14
    mul lr, r4, r3
    ldr r6, _LIT1
    add r3, r6, ip
    add r6, r3, lr
    ldr r7, [r6, #0x30]
    mov r6, r0
    mov r7, r7, lsl #0x13
    movs r7, r7, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT2
    add ip, r7, ip
    ldrh ip, [lr, ip]
    cmp ip, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r3, r3, #0x30
    ldr ip, [r3, lr]
    ldrh lr, [r6, #0x4]
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    mov lr, lr, lsl #0x11
    add r3, r3, ip, lsr #0x1f
    cmp r3, lr, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021c2084
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
