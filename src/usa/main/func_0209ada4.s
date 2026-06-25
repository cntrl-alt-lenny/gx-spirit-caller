; func_0209ada4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093720
        .extern func_0209a954
        .extern func_0209a970
        .extern func_0209acf0
        .extern func_0209ae54
        .extern func_0209b078
        .global func_0209ada4
        .arm
func_0209ada4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, _LIT0
    mov r6, r1
    bl func_02093720
    bl func_0209a954
    cmp r0, #0x1
    beq .L_90
    add r0, sp, #0x0
    add r1, sp, #0x4
    bl func_0209acf0
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_48
    mov r0, #0x0
    mov r1, r0
    bl func_0209ae54
.L_48:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_60
    mov r0, #0x1
    mov r1, #0x0
    bl func_0209ae54
.L_60:
    mov r0, #0x1
    bl func_0209a970
    cmp r0, #0x0
    bne .L_90
    ldr r5, _LIT0
    mov r4, #0x1
.L_78:
    mov r0, r5
    bl func_02093720
    mov r0, r4
    bl func_0209a970
    cmp r0, #0x0
    beq .L_78
.L_90:
    mov r1, r7
    mov r2, r6
    mov r0, #0xe
    bl func_0209b078
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x00996a00
