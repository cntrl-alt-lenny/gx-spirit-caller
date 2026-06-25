; func_ov002_021eec84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e7658
        .extern func_ov002_021e8ce4
        .extern func_ov002_021ea2a0
        .extern func_ov002_021eb874
        .extern func_ov002_021ed514
        .extern func_ov002_021f16e4
        .global func_ov002_021eec84
        .arm
func_ov002_021eec84:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x10
    movs r3, r3, lsr #0x1f
    beq .L_98
    ldrh lr, [r0]
    ldr ip, _LIT0
    cmp lr, ip
    bgt .L_4c
    bge .L_80
    ldr r3, _LIT1
    cmp lr, r3
    bgt .L_3c
    beq .L_70
    b .L_98
.L_3c:
    sub r3, ip, #0xb8
    cmp lr, r3
    beq .L_78
    b .L_98
.L_4c:
    ldr r3, _LIT2
    cmp lr, r3
    bgt .L_60
    beq .L_88
    b .L_98
.L_60:
    add r3, r3, #0xe9
    cmp lr, r3
    beq .L_90
    b .L_98
.L_70:
    bl func_ov002_021e8ce4
    ldmia sp!, {r3, pc}
.L_78:
    bl func_ov002_021ed514
    ldmia sp!, {r3, pc}
.L_80:
    bl func_ov002_021eb874
    ldmia sp!, {r3, pc}
.L_88:
    bl func_ov002_021f16e4
    ldmia sp!, {r3, pc}
.L_90:
    bl func_ov002_021e7658
    ldmia sp!, {r3, pc}
.L_98:
    bl func_ov002_021ea2a0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001753
_LIT1: .word 0x000014c5
_LIT2: .word 0x00001a35
