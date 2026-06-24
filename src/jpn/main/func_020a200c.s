; func_020a200c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a981c
        .extern func_020a1d74
        .extern func_020b3988
        .global func_020a200c
        .arm
func_020a200c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    add r4, r5, #0xc
    cmp r1, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    mov r2, r0
.L_f4:
    str r0, [r5, r2, lsl #0x2]
    add r3, r1, r2, lsl #0x4
    add r2, r2, #0x1
    ldr r3, [r3, #0x14]
    and r2, r2, #0xff
    cmp r2, #0x3
    add r0, r0, r3
    bcc .L_f4
    mov r8, #0x0
    strh r8, [r4]
    ldr r6, _LIT0
    add r7, r1, #0xc
.L_124:
    ldr r0, [r6]
    add sl, r7, r8, lsl #0x4
    add r0, r0, #0x1000
    ldr r1, [r0, #0x318]
    ldr r9, [sl, #0x8]
    add r0, r9, r1
    sub r0, r0, #0x1
    bl func_020b3988
    mov r1, r8, lsl #0x1
    ldrh r3, [r4, r1]
    mov r2, r0, lsl #0x10
    ldr r1, [sl, #0x4]
    add r2, r3, r2, lsr #0x10
    mov r3, r2, lsl #0x10
    mov r2, r9
    mov r0, r8
    mov r9, r3, lsr #0x10
    bl func_020a1d74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    cmp r8, #0x2
    addcc r0, r8, #0x1
    movcc r0, r0, lsl #0x1
    strcch r9, [r4, r0]
    add r0, r8, #0x1
    and r8, r0, #0xff
    strcsh r9, [r5, #0x12]
    cmp r8, #0x3
    bcc .L_124
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a981c
