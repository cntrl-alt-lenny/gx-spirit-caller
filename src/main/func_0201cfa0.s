; func_0201cfa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201cfe0
        .extern func_0201cff8
        .extern func_0202046c
        .global func_0201cfa0
        .arm
func_0201cfa0:
    stmdb sp!, {r3, lr}
    bl func_0202046c
    cmp r0, #0x4
    bne .L_38
    bl func_0201cfe0
    cmp r0, #0x0
    beq .L_30
    bl func_0201cff8
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
