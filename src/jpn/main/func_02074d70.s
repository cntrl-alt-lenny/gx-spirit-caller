; func_02074d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02074e0c
        .extern func_020752ac
        .extern func_0207540c
        .extern func_02075840
        .extern func_02076474
        .global func_02074d70
        .arm
func_02074d70:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02075840
    cmp r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_0207540c
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r4, #0xc]
    bl func_02076474
    mov r0, r4
    bl func_020752ac
    mov r0, r4
    bl func_02074e0c
    cmp r0, #0x0
    beq .L_90
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_58:
    mov r0, r4
    bl func_02075840
    cmp r0, #0x5
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_02074e0c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_020752ac
.L_90:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
