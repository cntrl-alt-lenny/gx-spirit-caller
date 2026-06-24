; func_020347f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201cf8c
        .extern func_020325e0
        .extern func_02046a58
        .global func_020347f4
        .arm
func_020347f4:
    stmdb sp!, {r3, lr}
    bl func_020325e0
    cmp r0, #0x1
    beq .L_1c
    cmp r0, #0x2
    beq .L_24
    b .L_38
.L_1c:
    bl func_0201cf8c
    ldmia sp!, {r3, pc}
.L_24:
    bl func_02046a58
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_38:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
