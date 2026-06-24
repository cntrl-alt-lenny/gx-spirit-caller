; func_020347c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020325e0
        .extern func_020454bc
        .extern func_0209e35c
        .global func_020347c0
        .arm
func_020347c0:
    stmdb sp!, {r3, lr}
    bl func_020325e0
    cmp r0, #0x1
    beq .L_74
    cmp r0, #0x2
    beq .L_7c
    b .L_84
.L_74:
    bl func_0209e35c
    ldmia sp!, {r3, pc}
.L_7c:
    bl func_020454bc
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
