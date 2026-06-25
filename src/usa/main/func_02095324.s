; func_02095324 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093720
        .extern func_02095250
        .extern func_02095390
        .extern func_02096318
        .extern func_02096340
        .global func_02095324
        .arm
func_02095324:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r0, #0x7
    bl func_02096340
    bl func_02095250
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, #0x7
    mov r1, #0x1
    bl func_02096318
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r6, #0x64
    mov r5, #0x7
    mov r4, #0x1
.L_44:
    mov r0, r6
    bl func_02093720
    mov r0, r5
    mov r1, r4
    bl func_02096318
    cmp r0, #0x0
    beq .L_44
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word func_02095390
