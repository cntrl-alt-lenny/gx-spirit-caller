; func_020954f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020952f0
        .extern func_02095460
        .extern func_02095828
        .global func_020954f4
        .arm
func_020954f4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_02095460
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r4, #0x0
.L_24:
    mov r0, r4
    bl func_02095828
    cmp r0, #0x0
    bne .L_24
    mov r0, r5
    bl func_02095460
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    bl func_020952f0
    mov r0, r5
    bl func_02095460
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r4, #0x1
.L_6c:
    mov r0, r4
    bl func_02095828
    mov r0, r5
    bl func_02095460
    cmp r0, #0x0
    beq .L_6c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
