; func_ov002_0222e5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b4618
        .extern func_ov002_021d59cc
        .extern func_ov002_021de8fc
        .extern func_ov002_02237d60
        .extern func_ov002_02257704
        .global func_ov002_0222e5e4
        .arm
func_ov002_0222e5e4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x1
    bne .L_20c
    bl func_ov002_02237d60
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_20c:
    ldr ip, _LIT0
    ldr r1, [ip, #0x5a8]
    cmp r1, #0x7f
    beq .L_250
    cmp r1, #0x80
    bne .L_300
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    mov r2, #0x2
    bl func_ov002_021de8fc
    bl func_ov002_021b4618
    ldr r1, _LIT0
    add sp, sp, #0x4
    str r0, [r1, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_250:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r3, r0, #0x1
    mov lr, r2, lsl #0x1a
    mul r2, r3, r1
    ldr r1, _LIT2
    mov r3, #0x14
    add r6, r1, r2
    mov r1, lr, lsr #0x1b
    ldrh r5, [r4, #0x4]
    mul r3, r1, r3
    mov lr, r5, lsl #0x11
    add r5, r6, #0x30
    ldr r5, [r5, r3]
    mov r6, lr, lsr #0x17
    mov lr, r5, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r5, r5, lsl #0x12
    mov lr, lr, lsl #0x1
    add r5, lr, r5, lsr #0x1f
    cmp r6, r5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr lr, _LIT3
    add r2, lr, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r3, [ip, #0x5ac]
    mov r2, #0x12c
    mul r2, r3, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp]
    ldrh r2, [r4]
    mov r3, #0x3
    bl func_ov002_021d59cc
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_300:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
