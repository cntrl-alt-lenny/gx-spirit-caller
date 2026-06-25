; func_0205405c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa24
        .extern data_020ffa30
        .extern func_020a6c60
        .global func_0205405c
        .arm
func_0205405c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    bmi .L_20
    ldr r0, [r5]
    cmp r4, r0
    blt .L_34
.L_20:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x94
    bl func_020a6c60
.L_34:
    cmp r4, #0x0
    blt .L_48
    ldr r0, [r5]
    cmp r4, r0
    blt .L_54
.L_48:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_54:
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0x8]
    mla r0, r1, r4, r0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffa30
_LIT1: .word data_020ffa24
