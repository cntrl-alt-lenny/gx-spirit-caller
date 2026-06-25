; func_0209d468 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093720
        .extern func_02093b08
        .extern func_0209ad68
        .extern func_0209d394
        .global func_0209d468
        .arm
func_0209d468:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r5, #0x1
    ldrh r0, [r0]
    and r0, r0, #0x8000
    movs r0, r0, asr #0xf
    beq .L_4c
    bl func_0209ad68
    cmp r0, #0x4
    bne .L_44
    ldr r4, _LIT1
.L_30:
    mov r0, r4
    bl func_02093720
    bl func_0209ad68
    cmp r0, #0x4
    beq .L_30
.L_44:
    cmp r0, #0x0
    moveq r5, #0x0
.L_4c:
    cmp r5, #0x0
    beq .L_60
    mov r0, #0x1
    mov r1, r0
    bl func_0209d394
.L_60:
    bl func_02093b08
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x027fffa8
_LIT1: .word 0x000a3a47
