; func_ov002_021e8ad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1e10
        .extern func_ov002_021c1fa4
        .extern func_ov002_021c8390
        .global func_ov002_021e8ad4
        .arm
func_ov002_021e8ad4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x4
    mov r5, r1
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr ip, _LIT0
    and r7, r5, #0x1
    mov r3, #0x14
    mul ip, r7, ip
    mul lr, r4, r3
    ldr r7, _LIT1
    add r3, r7, ip
    add r7, r3, lr
    ldr r7, [r7, #0x30]
    mov r7, r7, lsl #0x13
    movs r7, r7, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT2
    add ip, r7, ip
    ldrh ip, [lr, ip]
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
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
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r0, #0x3e8
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
