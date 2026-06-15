; func_0209ae98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093814
        .extern func_0209aa48
        .extern func_0209aa64
        .extern func_0209ade4
        .extern func_0209af48
        .extern func_0209b16c
        .global func_0209ae98
        .arm
func_0209ae98:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, _LIT0
    mov r6, r1
    bl func_02093814
    bl func_0209aa48
    cmp r0, #0x1
    beq .L_90
    add r0, sp, #0x0
    add r1, sp, #0x4
    bl func_0209ade4
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_48
    mov r0, #0x0
    mov r1, r0
    bl func_0209af48
.L_48:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_60
    mov r0, #0x1
    mov r1, #0x0
    bl func_0209af48
.L_60:
    mov r0, #0x1
    bl func_0209aa64
    cmp r0, #0x0
    bne .L_90
    ldr r5, _LIT0
    mov r4, #0x1
.L_78:
    mov r0, r5
    bl func_02093814
    mov r0, r4
    bl func_0209aa64
    cmp r0, #0x0
    beq .L_78
.L_90:
    mov r1, r7
    mov r2, r6
    mov r0, #0xe
    bl func_0209b16c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x00996a00
