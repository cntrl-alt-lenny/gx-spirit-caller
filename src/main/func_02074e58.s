; func_02074e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02074ef4
        .extern func_02075394
        .extern func_020754f4
        .extern func_02075928
        .extern func_0207655c
        .global func_02074e58
        .arm
func_02074e58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02075928
    cmp r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_020754f4
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r4, #0xc]
    bl func_0207655c
    mov r0, r4
    bl func_02075394
    mov r0, r4
    bl func_02074ef4
    cmp r0, #0x0
    beq .L_90
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_58:
    mov r0, r4
    bl func_02075928
    cmp r0, #0x5
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_02074ef4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_02075394
.L_90:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
