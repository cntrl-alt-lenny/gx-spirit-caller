; func_02000ef8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c60
        .extern data_021040ac
        .extern func_02000c4c
        .extern func_02000d4c
        .extern func_02001540
        .extern func_020057dc
        .global func_02000ef8
        .arm
func_02000ef8:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r0, [r4, #0xb64]
    cmp r0, #0x20
    bgt .L_34
    cmp r0, #0x1c
    blt .L_28
    cmpne r0, #0x20
    beq .L_4c
    b .L_78
.L_28:
    cmp r0, #0x16
    beq .L_4c
    b .L_78
.L_34:
    cmp r0, #0x34
    bgt .L_44
    beq .L_4c
    b .L_78
.L_44:
    cmp r0, #0x36
    bne .L_78
.L_4c:
    bl func_02000d4c
    str r0, [r4, #0xb64]
    bl func_02000c4c
    ldr r1, _LIT1
    str r0, [r1]
    ldr r0, _LIT2
    bl func_020057dc
    mov r0, #0x0
    str r0, [r4, #0xb68]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_78:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02102c60
_LIT2: .word func_02001540
