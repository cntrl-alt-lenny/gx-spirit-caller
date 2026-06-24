; func_02061f98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061a18
        .extern func_02061f30
        .extern func_02062888
        .extern func_02062ad4
        .extern func_0206471c
        .global func_02061f98
        .arm
func_02061f98:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_ad4
    ldr r1, [r4, #0xc]
    cmp r1, #0x7
    ldmgeia sp!, {r4, pc}
    bl func_02061f30
    mov r0, r4
    bl func_02062888
    mov r0, r4
    mov r1, #0x0
    bl func_02061a18
    mov r0, r4
    bl func_0206471c
    ldmia sp!, {r4, pc}
.L_ad4:
    mov r1, #0x6
    str r1, [r4, #0xc]
    bl func_02062ad4
    ldmia sp!, {r4, pc}
