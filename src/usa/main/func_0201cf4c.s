; func_0201cf4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201cf8c
        .extern func_0201cfa4
        .extern func_02020418
        .global func_0201cf4c
        .arm
func_0201cf4c:
    stmdb sp!, {r3, lr}
    bl func_02020418
    cmp r0, #0x4
    bne .L_38
    bl func_0201cf8c
    cmp r0, #0x0
    beq .L_30
    bl func_0201cfa4
    cmp r0, #0x1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
.L_30:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_38:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
