; func_ov000_021abfb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov000_021abd84
        .global func_ov000_021abfb8
        .arm
func_ov000_021abfb8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r6, r1
    mov r4, r2
    bl func_ov000_021abd84
    ldr r2, [r5]
    mov r3, r2, lsl #0x11
    cmp r6, r3, lsr #0x17
    bcc .L_a4
    mov r1, r2, lsr #0x18
    add r1, r1, r3, lsr #0x17
    cmp r6, r1
    bcs .L_a4
    mov ip, r2, lsl #0x8
    cmp r4, ip, lsr #0x17
    bcc .L_a4
    ldr r3, [r5, #0x4]
    mov r1, r3, lsl #0x18
    mov r1, r1, lsr #0x18
    add r5, r1, ip, lsr #0x17
    cmp r4, r5
    bcs .L_a4
    mov r1, r3, lsl #0x10
    mov r2, r1, lsr #0x18
    add r1, r2, ip, lsr #0x17
    cmp r4, r1
    movcc r0, #0x1
    ldmccia sp!, {r4, r5, r6, pc}
    cmp r4, r0
    movlt r0, #0x2
    ldmltia sp!, {r4, r5, r6, pc}
    mov r1, r3, lsl #0x8
    add r0, r0, r1, lsr #0x18
    cmp r4, r0
    movcc r0, #0x3
    ldmccia sp!, {r4, r5, r6, pc}
    sub r0, r5, r2
    cmp r4, r0
    movcc r0, #0x4
    movcs r0, #0x5
    ldmia sp!, {r4, r5, r6, pc}
.L_a4:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
