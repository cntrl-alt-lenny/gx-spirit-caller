; func_ov005_021ac814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ac814
        .arm
func_ov005_021ac814:
    stmdb sp!, {r4, lr}
    ldrsh r1, [r0, #0xc]
    ldr r2, [r0, #0x20]
    mov lr, #0x0
    mov r1, r1, asr #0x3
    add r3, r2, r1, lsl #0x1
    mov r4, #0x1
    mov r2, lr
.L_b10:
    ldrh r1, [r0, #0x14]
    mov ip, r2
    cmp r1, #0x0
    ble .L_b40
.L_b20:
    ldrh r1, [r0, #0x24]
    add ip, ip, #0x1
    orr r1, r4, r1, lsl #0xc
    strh r1, [r3], #0x2
    ldrh r1, [r0, #0x14]
    add r4, r4, #0x1
    cmp ip, r1
    blt .L_b20
.L_b40:
    rsb r1, r1, #0x20
    add lr, lr, #0x1
    cmp lr, #0x20
    add r3, r3, r1, lsl #0x1
    blt .L_b10
    ldmia sp!, {r4, pc}
