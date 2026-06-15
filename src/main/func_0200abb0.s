; func_0200abb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4768
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202af40
        .extern func_0202b0e0
        .extern func_0202ba94
        .extern func_0202e2f8
        .global func_0200abb0
        .arm
func_0200abb0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x3c
    add r0, sp, #0x0
    bl func_0202adf8
    mvn r0, #0x0
    bl func_0202ae1c
    ldr r0, _LIT0
    mov r6, #0x1
    ldr r7, [r0]
    cmp r7, #0x1
    ble .L_60
    mov r4, r6
.L_30:
    mov r0, r6
    bl func_0202b0e0
    mov r5, r0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_54
    mov r0, r5
    mov r1, r4
    bl func_0202ba94
.L_54:
    add r6, r6, #0x1
    cmp r6, r7
    blt .L_30
.L_60:
    bl func_0202af40
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020b4768
