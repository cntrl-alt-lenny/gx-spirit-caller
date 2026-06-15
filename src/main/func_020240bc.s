; func_020240bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021cd8
        .extern func_020224c0
        .extern func_02024368
        .extern func_0208c04c
        .global func_020240bc
        .arm
func_020240bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5]
    bl func_02021cd8
    cmp r0, #0x0
    bne .L_200
    add sl, sp, #0x0
    mov r6, #0x0
.L_24:
    ldr r0, [r5]
    ldr r2, [r0]
    mov r0, r2, lsr #0x18
    cmp r0, #0x30
    beq .L_4c
    cmp r0, #0x31
    beq .L_64
    cmp r0, #0x32
    beq .L_134
    b .L_1e4
.L_4c:
    mov r0, r5
    bl func_02024368
    ldr r0, [r5]
    add r0, r0, #0x4
    str r0, [r5]
    b .L_1e4
.L_64:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r5
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r5]
    mov r7, r0
    ldr r1, [r2]
    ldr r0, [r2, #0x4]
    mov r1, r1, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r5
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [sp]
    ldr r2, [r5]
    mov r0, r5
    ldr r1, [r2, #0x4]
    ldr r3, [r2]
    mov r2, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [sp, #0x2]
    ldr r2, [r5]
    mov r0, r5
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [sp, #0x4]
    mov r0, sl
    mov r1, sl
    bl func_0208c04c
    add r2, r5, r7, lsl #0x3
    ldrh r1, [sp]
    ldrh r0, [sp, #0x2]
    strh r1, [r2, #0x68]
    strh r0, [r2, #0x6a]
    ldrh r0, [sp, #0x4]
    strh r0, [r2, #0x6c]
    ldr r0, [r5]
    add r0, r0, #0xc
    str r0, [r5]
    b .L_1e4
.L_134:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r5
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r5]
    mov r9, r0
    ldr r1, [r2]
    ldr r0, [r2, #0x4]
    mov r1, r1, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r0, r5
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r5]
    mov r8, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r1]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r5
    bl func_020224c0
    mov r7, r0
    ldr r2, [r5]
    mov r0, r5
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    orr r1, r8, r7, lsl #0x5
    orr r1, r1, r0, lsl #0xa
    add r0, r5, r9, lsl #0x3
    strh r1, [r0, #0x6e]
    ldr r0, [r5]
    add r0, r0, #0xc
    str r0, [r5]
.L_1e4:
    ldr r0, [r5]
    cmp r0, r4
    mov r0, r5
    strne r6, [r5, #0x4]
    bl func_02021cd8
    cmp r0, #0x0
    beq .L_24
.L_200:
    ldr r1, [r5, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
