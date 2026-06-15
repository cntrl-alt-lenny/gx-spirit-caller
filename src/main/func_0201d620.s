; func_0201d620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0201d620
        .arm
func_0201d620:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r2, [r0, #0xe]
    ldrh r4, [r0, #0xc]
    mov r3, #0x0
    cmp r2, #0x0
    add r0, r0, r4
    ble .L_284
    mov r4, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov ip, r4, lsl #0x10
    mov lr, r1, lsr #0x10
    mov r1, ip, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r4, r1, lsr #0x10
    mov r1, lr, asr #0x8
    and ip, r1, #0xff
    and r1, lr, #0xff
    orr r1, ip, r1, lsl #0x8
    mov r5, r4, asr #0x8
    mov r1, r1, lsl #0x10
    mov ip, r1, lsr #0x10
    and lr, r5, #0xff
    and r1, r4, #0xff
    orr r1, lr, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov ip, ip, lsl #0x10
    orr r4, ip, r1, lsr #0x10
.L_264:
    ldr r1, [r0]
    cmp r1, r4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r0, #0x4]
    add r3, r3, #0x1
    cmp r3, r2
    add r0, r0, r1
    blt .L_264
.L_284:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
