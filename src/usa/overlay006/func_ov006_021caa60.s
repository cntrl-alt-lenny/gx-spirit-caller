; func_ov006_021caa60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021caa60
        .arm
func_ov006_021caa60:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov ip, #0x0
    str ip, [r3]
    str ip, [r3, #0x4]
    ldr lr, [r0, #0x60]
    cmp lr, #0x0
    ble .L_508
    ldr r6, [r0, #0x58]
    ldr r5, [r0, #0x7c]
    ldr r4, [r0, #0x5c]
    ldr r7, [r0, #0x78]
    add r5, r5, r4, lsl #0x3
    mov r6, r6, lsl #0x3
    add r4, r6, r6, lsr #0x1f
    sub r5, r5, #0x16
    add r4, r7, r4, asr #0x1
    rsb r0, lr, #0x1
    add r6, r5, #0xc
    sub r7, r5, #0xc
.L_4c4:
    mov r5, r0, lsl #0x6
    add r5, r5, r5, lsr #0x1f
    add r8, r4, r5, asr #0x1
    sub r5, r8, #0x1c
    cmp r1, r5
    cmpge r2, r7
    blt .L_4f8
    add r5, r8, #0x1c
    cmp r1, r5
    cmple r2, r6
    movle r0, #0x1
    stmleia r3, {r0, ip}
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
.L_4f8:
    add ip, ip, #0x1
    cmp ip, lr
    add r0, r0, #0x2
    blt .L_4c4
.L_508:
    mov r0, #0x0
    str r0, [r3]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
