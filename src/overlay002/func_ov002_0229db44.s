; func_ov002_0229db44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d890
        .global func_ov002_0229db44
        .arm
func_ov002_0229db44:
    stmdb sp!, {r3, r4, r5, lr}
    and r2, r1, #0x1f
    mov r3, #0x1
    mov r3, r3, lsl r2
    mov r2, r1, asr #0x4
    sub r5, r3, #0x1
    add r1, r1, r2, lsr #0x1b
    mov r4, #0x0
    mvn ip, r5
.L_e4:
    cmp r4, r1, asr #0x5
    bne .L_108
    add lr, r0, r4, lsl #0x2
    ldr r2, [lr, #0xbc]
    and r3, r2, r5
    and r2, ip, r2, lsr #0x1
    orr r2, r3, r2
    str r2, [lr, #0xbc]
    b .L_11c
.L_108:
    ble .L_11c
    add r3, r0, r4, lsl #0x2
    ldr r2, [r3, #0xbc]
    mov r2, r2, lsr #0x1
    str r2, [r3, #0xbc]
.L_11c:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_e4
    ldr r1, [r0, #0xa4]
    mov r2, #0x0
    sub r1, r1, #0x1
    str r1, [r0, #0xa4]
    ldr r1, [r0, #0xa8]
    bl func_ov002_0229d890
    ldmia sp!, {r3, r4, r5, pc}
