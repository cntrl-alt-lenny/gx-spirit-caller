; func_0205caa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a84
        .extern data_02100bb0
        .extern func_0205cb44
        .extern func_0205ce9c
        .extern func_0205d0e8
        .extern func_020a6c60
        .global func_0205caa0
        .arm
func_0205caa0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, [r5]
    mov r6, r0
    cmp r1, #0x64
    mov r4, #0x0
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, r4
    bl func_020a6c60
.L_30:
    ldr r0, [r5]
    cmp r0, #0x69
    beq .L_6c
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_5c
    mov r0, r6
    mov r1, r5
    bl func_0205d0e8
    mov r4, r0
    b .L_6c
.L_5c:
    mov r0, r6
    mov r1, r5
    bl func_0205ce9c
    mov r4, r0
.L_6c:
    cmp r4, #0x0
    bne .L_90
    ldr r0, [r5]
    cmp r0, #0x69
    bne .L_90
    mov r0, r6
    mov r1, r5
    bl func_0205cb44
    mov r4, r0
.L_90:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100bb0
_LIT1: .word data_02100a84
_LIT2: .word 0x000001d9
