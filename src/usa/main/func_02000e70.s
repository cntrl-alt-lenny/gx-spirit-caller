; func_02000e70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02000d9c
        .extern func_02000e34
        .extern func_02000ec8
        .extern func_02018b70
        .global func_02000e70
        .arm
func_02000e70:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    bl func_02018b70
    mov r0, r4
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_30
    cmp r0, #0x1
    beq .L_38
    cmp r0, #0x2
    beq .L_4c
    ldmia sp!, {r4, pc}
.L_30:
    bl func_02000e34
    ldmia sp!, {r4, pc}
.L_38:
    bl func_02000d9c
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r4, #0xb64]
    ldmia sp!, {r4, pc}
.L_4c:
    bl func_02000ec8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103fcc
