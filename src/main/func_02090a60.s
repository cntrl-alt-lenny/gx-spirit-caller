; func_02090a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020937d0
        .extern func_020937e4
        .global func_02090a60
        .arm
func_02090a60:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r1
    ldrh r1, [r7, #0x4]
    mov r6, r2
    mov r5, r3
    cmp r0, r1
    addne sp, sp, #0x4
    mvnne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r5, #0x0
    beq .L_40
    bl func_020937d0
    mov r4, r0
    b .L_48
.L_40:
    bl OS_DisableIrq
    mov r4, r0
.L_48:
    mov r0, #0x0
    strh r0, [r7, #0x4]
    cmp r6, #0x0
    beq .L_5c
    blx r6
.L_5c:
    mov r0, #0x0
    str r0, [r7]
    cmp r5, #0x0
    beq .L_78
    mov r0, r4
    bl func_020937e4
    b .L_80
.L_78:
    mov r0, r4
    bl OS_RestoreIrq
.L_80:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
