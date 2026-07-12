; func_ov008_021accf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern func_020371b8
        .extern func_020b377c
        .global func_ov008_021accf0
        .arm
func_ov008_021accf0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldrh r4, [r1, #0x5a]
    mov r0, #0xf0
    cmp r4, #0x6
    movhi r4, #0x6
    mov r1, r4, lsl #0x1
    bl func_020b377c
    ldr r1, _LIT1
    cmp r4, #0x0
    ldrh r1, [r1, #0x4]
    mov r3, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    ble .L_7d8
    mov ip, r0, lsl #0x1
.L_7bc:
    add r2, r0, #0x18
    cmp r5, r2
    blt .L_7d8
    add r3, r3, #0x1
    cmp r3, r4
    add r0, r0, ip
    blt .L_7bc
.L_7d8:
    cmp r3, r4
    bne .L_800
    ldr r2, _LIT1
    sub r0, r4, #0x1
    ldrh r3, [r2, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff00
    mov r0, r0, lsl #0x18
    b .L_818
.L_800:
    ldr r2, _LIT1
    mov r0, r3, lsl #0x10
    ldrh r3, [r2, #0x4]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r3, r3, #0xff00
.L_818:
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0x4]
    ldr r0, _LIT1
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b2b60
_LIT1: .word data_ov008_021b2ca0
