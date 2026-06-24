; func_ov002_0222812c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afba0
        .extern func_ov002_021d7d0c
        .extern func_ov002_021d8288
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .global func_ov002_0222812c
        .arm
func_ov002_0222812c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_140
    b .L_158
.L_20:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_158
    b .L_124
    b .L_158
    b .L_158
    b .L_158
    b .L_158
    b .L_cc
    b .L_a8
    b .L_158
    b .L_54
.L_54:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_90
    mov r0, r0, lsl #0x1f
    mov r1, #0x15
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_90:
    mov r0, r0, lsl #0x1f
    mov r1, #0x37
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_a8:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_cc:
    bl func_ov002_021afba0
    cmp r0, #0xd
    beq .L_e4
    cmp r0, #0xe
    beq .L_100
    b .L_11c
.L_e4:
    bl func_ov002_021afb74
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8288
    b .L_11c
.L_100:
    bl func_ov002_021afb74
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7d0c
.L_11c:
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_124:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_140:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
