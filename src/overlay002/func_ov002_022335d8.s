; func_ov002_022335d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202e234
        .extern func_020305d8
        .extern func_ov002_021bc618
        .extern func_ov002_021c988c
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca440
        .extern func_ov002_021d8298
        .extern func_ov002_021d87dc
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2818
        .extern func_ov002_021e2d20
        .extern func_ov002_0227adb8
        .global func_ov002_022335d8
        .arm
func_ov002_022335d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x0
    beq .L_18c
    ldr r2, _LIT2
    mov r1, #0xd
    add r2, r2, r4
    ldr r3, [r2, #0x260]
    mov r2, #0x0
    mov r3, r3, lsl #0x13
    mov r4, r3, lsr #0x13
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_70
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2818
.L_70:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d87dc
    mov r0, r4
    bl func_0202e234
    cmp r0, #0x0
    beq .L_144
    mov r0, r4
    bl func_020305d8
    cmp r0, #0x0
    beq .L_144
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_144
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_124
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_124
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r0, #0x1
    and r2, r2, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227adb8
    b .L_18c
.L_124:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e13f4
    b .L_18c
.L_144:
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    mov r2, #0x0
    bl func_ov002_021d8298
    ldrh r0, [r5, #0x2]
    mov r1, #0x2
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2d20
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
