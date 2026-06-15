; func_0201b770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_0201b6d4
        .global func_0201b770
        .arm
func_0201b770:
    stmdb sp!, {r3, r4, r5, lr}
    bl GetSystemWork
    mov r5, r0
    mov r4, #0x0
    bl func_020139b4
    cmp r0, #0x2
    beq .L_34
    mov r0, #0xc
    bl func_0201b6d4
    mov r4, r0
    mov r0, #0x8
    bl func_0201b6d4
    orr r4, r4, r0
.L_34:
    ldr r1, [r5, #0x8f4]
    mvn r0, r4
    and r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
