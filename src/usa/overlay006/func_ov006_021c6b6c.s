; func_ov006_021c6b6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb73c
        .extern func_0208e038
        .extern func_ov006_021c6e18
        .global func_ov006_021c6b6c
        .arm
func_ov006_021c6b6c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x50
    ldr r7, _LIT0
    add r6, sp, #0x0
    mov r4, r0
    mov r5, #0x5
.L_18:
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_18
    ldr r2, [r4, #0x48]
    ldr r1, _LIT1
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r2, r0, asr #0x2
    umull r1, r5, r2, r1
    mov r5, r5, lsr #0x4
    mov r3, #0x14
    umull r1, r2, r3, r5
    rsb r5, r1, r0, asr #0x2
    add r2, sp, #0x0
    mov r0, r4
    ldr r4, [r2, r5, lsl #0x2]
    bl func_ov006_021c6e18
    cmp r0, #0x0
    beq .L_c4
    cmp r4, #0x0
    blt .L_c4
    rsb r0, r4, r4, lsl #0x4
    add r0, r0, #0xa
    mov r6, #0x0
    add r7, r0, #0x200
    mov r4, r6
.L_84:
    mov r5, r4
.L_88:
    bl func_0208e038
    add r0, r0, r6, lsl #0x6
    add r1, r5, r7
    add r0, r0, r5, lsl #0x1
    add r5, r5, #0x1
    orr r1, r1, #0x3000
    add r0, r0, #0x400
    strh r1, [r0, #0xf6]
    cmp r5, #0x5
    blt .L_88
    add r6, r6, #0x1
    cmp r6, #0x3
    add r7, r7, #0x5
    blt .L_84
    b .L_100
.L_c4:
    mov r6, #0x0
    mov r4, #0x3000
    mov r5, r6
.L_d0:
    mov r7, r5
.L_d4:
    bl func_0208e038
    add r0, r0, r6, lsl #0x6
    add r0, r0, r7, lsl #0x1
    add r0, r0, #0x400
    add r7, r7, #0x1
    strh r4, [r0, #0xf6]
    cmp r7, #0x5
    blt .L_d4
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_d0
.L_100:
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_021cb73c
_LIT1: .word 0xcccccccd
