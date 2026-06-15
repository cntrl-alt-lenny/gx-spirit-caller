; func_020347b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2dc
        .extern func_0201cfa0
        .extern func_02032634
        .extern func_02046ae0
        .global func_020347b8
        .arm
func_020347b8:
    stmdb sp!, {r3, lr}
    bl func_02032634
    cmp r0, #0x1
    beq .L_1c
    cmp r0, #0x2
    beq .L_24
    b .L_4c
.L_1c:
    bl func_0201cfa0
    ldmia sp!, {r3, pc}
.L_24:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_44
    bl func_02046ae0
    cmp r0, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r3, pc}
.L_44:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_4c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b2dc
