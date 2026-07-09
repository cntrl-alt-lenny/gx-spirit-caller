; func_ov002_0222f34c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202df24
        .extern func_ov002_021ae320
        .extern func_ov002_021c3a04
        .extern func_ov002_021d7880
        .extern func_ov002_021e26d0
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022574ac
        .extern func_ov002_0226ae48
        .global func_ov002_0222f34c
        .arm
func_ov002_0222f34c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    ldrh r9, [r4, #0x8]
    cmp r2, #0x78
    bgt .L_40
    cmp r2, #0x77
    blt .L_34
    beq .L_19c
    cmp r2, #0x78
    beq .L_180
    b .L_1ec
.L_34:
    cmp r2, #0x64
    beq .L_1cc
    b .L_1ec
.L_40:
    cmp r2, #0x7f
    bgt .L_50
    beq .L_c4
    b .L_1ec
.L_50:
    cmp r2, #0x80
    bne .L_1ec
    bl func_ov002_022574ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, r9, lsl #0x10
    ldrh r2, [r4, #0x2]
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c3a04
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c4:
    bl func_ov002_021e2a4c
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mul r0, r2, r5
    ldr r1, [r1, r0]
    mov r8, #0x0
    cmp r1, #0x0
    bls .L_174
    ldr r7, _LIT4
    mov sl, r8
    mov r6, #0x1
.L_104:
    add r0, r7, r0
    add r0, r0, sl
    ldr r0, [r0, #0x120]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_144
    ldrh r0, [r4, #0x2]
    mov r1, r8
    mov r2, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d7880
.L_144:
    ldrh r0, [r4, #0x2]
    add r8, r8, #0x1
    add sl, sl, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mul r0, r1, r5
    add r1, r7, r0
    ldr r1, [r1, #0xc]
    cmp r8, r1
    bcc .L_104
.L_174:
    bl func_ov002_021e2b6c
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_180:
    ldrh r0, [r4, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_19c:
    ldrh r1, [r4]
    ldr r0, _LIT5
    cmp r1, r0
    bne .L_1c4
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226ae48
.L_1c4:
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1cc:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1ec:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000106
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00001803
