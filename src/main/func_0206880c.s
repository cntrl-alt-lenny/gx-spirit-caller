; func_0206880c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d5c
        .extern func_02068890
        .extern func_020688fc
        .extern func_02068b54
        .global func_0206880c
        .arm
func_0206880c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    add r0, r1, #0x1
    mov r1, #0x5c
    bl func_02068890
    movs r8, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r4, _LIT0
    mov r6, #0x0
    mov r5, #0x5c
.L_274:
    mov r0, r6
    mov r1, r5
    bl func_02068890
    movs r7, r0
    mov r0, r8
    moveq r7, r4
    bl func_020688fc
    cmp r0, #0x0
    beq .L_2a8
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_02068b54
.L_2a8:
    mov r0, r6
    mov r1, r5
    bl func_02068890
    movs r8, r0
    bne .L_274
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101d5c
