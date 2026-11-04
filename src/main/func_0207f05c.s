; func_0207f05c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08f4
        .global func_0207f05c
        .arm
func_0207f05c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldrh lr, [r0, #0x6]
    ldrh ip, [r0, #0x8]
    mov r4, #0x0
    add r3, lr, #0x1
    cmp ip, r3
    bgt .L_5a4
    ldrh r3, [r0, #0x4]
    cmp r3, lr
    movls r4, #0x1
.L_5a4:
    cmp r4, #0x0
    subne r3, lr, ip
    addne r3, r3, #0x1
    movne r3, r3, lsl #0x10
    movne r3, r3, lsr #0x10
    moveq r3, #0x0
    cmp r3, r2
    movcs r3, #0x1
    movcc r3, #0x0
    cmp r3, #0x0
    beq .L_644
    ldr lr, [r0]
    ldr ip, _LIT0
    mov r3, #0x540
    mla ip, lr, r3, ip
    ldrh r3, [r0, #0x8]
    add ip, ip, #0x100
    cmp r2, #0x0
    add r4, ip, r3, lsl #0x3
    mov r5, #0x0
    ble .L_638
    add r3, r0, #0x8
.L_5fc:
    ldrh lr, [r1]
    mov r0, r5, lsl #0x3
    add ip, r4, r5, lsl #0x3
    strh lr, [r4, r0]
    ldrh r0, [r1, #0x2]
    add r5, r5, #0x1
    cmp r5, r2
    strh r0, [ip, #0x2]
    ldrh r0, [r1, #0x4]
    add r1, r1, #0x8
    strh r0, [ip, #0x4]
    ldrh r0, [r3]
    add r0, r0, #0x1
    strh r0, [r3]
    blt .L_5fc
.L_638:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_644:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a08f4
