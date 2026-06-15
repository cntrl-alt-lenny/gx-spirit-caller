; func_02095418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093814
        .extern func_02095344
        .extern func_02095484
        .extern func_0209640c
        .extern func_02096434
        .global func_02095418
        .arm
func_02095418:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r0, #0x7
    bl func_02096434
    bl func_02095344
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, #0x7
    mov r1, #0x1
    bl func_0209640c
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r6, #0x64
    mov r5, #0x7
    mov r4, #0x1
.L_78:
    mov r0, r6
    bl func_02093814
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_78
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word func_02095484
