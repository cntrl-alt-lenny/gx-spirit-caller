; func_ov008_021b1be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b22bc
        .extern data_ov008_021b25ec
        .extern func_0208e0e4
        .global func_ov008_021b1be4
        .arm
func_ov008_021b1be4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r5, _LIT0
    add lr, sp, #0x0
    mov r4, r0
    mov ip, #0x5
.L_207c:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_207c
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    mov r3, #0x14
    ldr r2, [r0, #0x24]
    add ip, sp, #0x0
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r2, r0, asr #0x2
    umull r1, lr, r2, r1
    mov lr, lr, lsr #0x4
    umull r1, r2, r3, lr
    rsb lr, r1, r0, asr #0x2
    ldr r5, [ip, lr, lsl #0x2]
    bl func_0208e0e4
    add r0, r0, #0xf6
    cmp r4, #0x0
    add ip, r0, #0x400
    beq .L_20e0
    cmp r5, #0x0
    bge .L_2118
.L_20e0:
    mov r2, #0x0
    mov r0, r2
    mov r1, r2
.L_20ec:
    mov r3, r1
.L_20f0:
    add r3, r3, #0x1
    cmp r3, #0x5
    strh r0, [ip], #0x2
    blt .L_20f0
    add r2, r2, #0x1
    cmp r2, #0x3
    add ip, ip, #0x36
    blt .L_20ec
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
.L_2118:
    rsb r0, r5, r5, lsl #0x4
    mov r2, #0x0
    add r4, r0, #0x290
    mov r1, r2
.L_2128:
    mov r3, r1
.L_212c:
    orr r0, r4, #0x4000
    add r3, r3, #0x1
    cmp r3, #0x5
    add r4, r4, #0x1
    strh r0, [ip], #0x2
    blt .L_212c
    add r2, r2, #0x1
    cmp r2, #0x3
    add ip, ip, #0x36
    blt .L_2128
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b22bc
_LIT1: .word data_ov008_021b25ec
_LIT2: .word 0xcccccccd
