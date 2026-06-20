; func_ov002_021eee20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1ef0
        .global func_ov002_021eee20
        .arm
func_ov002_021eee20:
    stmdb sp!, {r3, lr}
    cmp r2, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mul lr, r2, r3
    add r3, ip, #0x30
    ldr ip, [r3, lr]
    mov r3, ip, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r3, ip, lsl #0x2
    ldrh lr, [r0, #0x4]
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    mov lr, lr, lsl #0x11
    add r3, r3, ip, lsr #0x1f
    cmp r3, lr, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
