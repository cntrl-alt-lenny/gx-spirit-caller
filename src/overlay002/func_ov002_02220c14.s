; func_ov002_02220c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202b878
        .extern func_ov002_021d63fc
        .extern func_ov002_021de4d8
        .extern func_ov002_021de9d4
        .extern func_ov002_021df62c
        .extern func_ov002_021df708
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b1c
        .extern func_ov002_021e358c
        .extern func_ov002_021fd668
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_02220c14
        .arm
func_ov002_02220c14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r9, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x64
    beq .L_1cc
    cmp r1, #0x7f
    beq .L_19c
    cmp r1, #0x80
    bne .L_228
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_194
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0223de94
    and r5, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r4, r1, r0
    ldr r1, _LIT2
    and r6, r2, #0xff
    mov r0, #0x14
    smulbb r8, r6, r0
    add r0, r1, r4
    add r0, r0, r8
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r7, r0, lsr #0x13
    beq .L_194
    ldr r0, _LIT3
    add r0, r0, r4
    ldrh r0, [r8, r0]
    cmp r0, #0x0
    bne .L_194
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_021d63fc
    mov r0, r5
    mov r1, r7
    bl func_ov002_021df708
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    mov r0, r7
    bl func_0202b878
    cmp r0, #0x17
    bne .L_180
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_180
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_021fd668
    cmp r0, #0x0
    beq .L_178
    ldr r1, _LIT2
    mov r0, r5
    add r1, r1, r4
    add r4, r1, #0x30
    ldr r3, [r4, r8]
    mov r1, r6
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r1, [r4, r8]
    mov r2, r5, lsl #0x1f
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    and r3, r2, #-2147483648
    mov r2, r6, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, r3, #0x44000000
    and r2, r2, #0x1f0000
    mov r0, r7, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e358c
    b .L_194
.L_178:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_180:
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_021d63fc
.L_194:
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_19c:
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r9
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021de4d8
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1cc:
    ldrh r3, [r9, #0x2]
    ldr r4, _LIT2
    ldr r2, _LIT1
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r5, r3, lsl #0x1a
    and r3, r1, #0x1
    mla r4, r3, r2, r4
    mov r2, r5, lsr #0x1b
    mov r3, #0x14
    mul r3, r2, r3
    add r4, r4, #0x30
    ldr r3, [r4, r3]
    mov r4, r3, lsl #0x13
    movs r4, r4, lsr #0x13
    beq .L_220
    mov r3, r3, lsl #0x12
    mov r4, r3, lsr #0x1f
    bl func_ov002_021de9d4
    mov r0, r4
    bl func_ov002_021e286c
.L_220:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_228:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
