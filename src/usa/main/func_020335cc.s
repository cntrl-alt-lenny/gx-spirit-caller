; func_020335cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032d1c
        .extern func_0203347c
        .extern func_02047110
        .global func_020335cc
        .arm
func_020335cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xeac]
    tst r1, #0x1
    ldmeqia sp!, {r4, pc}
    bl func_0203347c
    cmp r0, #0x0
    bne .L_70
    mov r0, r4
    bl func_02032d1c
.L_70:
    bl func_02047110
    mov r0, r4
    bl func_0203347c
    ldmia sp!, {r4, pc}
