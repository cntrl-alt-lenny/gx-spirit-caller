; func_0209fe94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209d724
        .extern func_0209dca8
        .extern func_0209fbe8
        .extern func_0209fd28
        .global func_0209fe94
        .arm
func_0209fe94:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0209dca8
    ldrh r2, [r5, #0xa]
    ldr r1, _LIT0
    add r0, r0, r2, lsl #0x2
    ldr r2, [r0, #0xcc]
    ldr r4, [r0, #0x10c]
    cmp r2, r1
    beq .L_d24
    ldr r0, _LIT1
    cmp r2, r0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_d24:
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [r5, #0x20]
    cmp r4, r0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    bl func_0209d724
    ldrh r1, [r5, #0x2]
    cmp r1, #0x0
    bne .L_da0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    add r1, r4, #0x800
    ldrh r0, [r1, #0xa]
    ldrh r2, [r5, #0x1a]
    add sp, sp, #0x4
    add r0, r4, r0, lsl #0x1
    mov r2, r2, asr #0x1
    add r0, r0, #0x800
    strh r2, [r0]
    ldrh r0, [r1, #0xa]
    add r0, r0, #0x1
    and r0, r0, #0x3
    strh r0, [r1, #0xa]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_da0:
    cmp r1, #0xa
    bne .L_dd8
    cmp r0, #0x0
    addne r0, r4, #0x800
    ldrneh r1, [r0, #0xa]
    add sp, sp, #0x4
    addne r1, r1, #0x3
    andne r1, r1, #0x3
    strneh r1, [r0, #0xa]
    add r0, r4, #0x800
    mov r1, #0x4
    strh r1, [r0, #0x1c]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_dd8:
    add r0, r4, #0x800
    mov r1, #0x5
    strh r1, [r0, #0x1c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word func_0209fd28
_LIT1: .word func_0209fbe8
