; func_ov002_021f4ed0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b947c
        .extern func_ov002_021d5b80
        .extern func_ov002_021df62c
        .extern func_ov002_021e2d94
        .extern func_ov002_022577dc
        .global func_ov002_021f4ed0
        .arm
func_ov002_021f4ed0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    ldrh r0, [r4, #0x4]
    beq .L_150
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b947c
    ldrh r3, [r4, #0x2]
    and r1, r0, #0xff
    mov r2, r3, lsl #0x1f
    cmp r1, r2, lsr #0x1f
    mov r2, r2, lsr #0x1f
    bne .L_fc
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r3, r3, lsl #0x1a
    and r1, r1, #0xff
    cmp r1, r3, lsr #0x1b
    mov r1, r3, lsr #0x1b
    bne .L_fc
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    ldr r3, _LIT0
    mov r0, r0, lsr #0x10
    cmp r0, r3
    beq .L_d0
    ldr r0, _LIT1
    mov r3, #0x14
    ldr ip, _LIT2
    and lr, r2, #0x1
    mul r3, r1, r3
    mla r0, lr, r0, ip
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    beq .L_d0
    mov r0, r2
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT3
    mov r3, #0x1
    mov ip, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d5b80
.L_d0:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_fc:
    ldrh r1, [r4]
    ldr r0, _LIT4
    cmp r1, r0
    bne .L_148
    mov r0, r4
    bl func_ov002_022577dc
    cmp r0, #0x0
    beq .L_148
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_148:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_150:
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x00001174
_LIT4: .word 0x00001a90
