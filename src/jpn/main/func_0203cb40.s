; func_0203cb40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d8e8
        .extern func_0203c838
        .global func_0203cb40
        .arm
func_0203cb40:
    stmdb sp!, {r4, lr}
    mov r4, #0xff
    bl func_0203c838
    cmp r0, #0xa
    bcc .L_318
    cmp r0, #0x10
    ldrls r0, _LIT0
    ldrls r0, [r0]
    ldrlsb r4, [r0, #0x17]
.L_318:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d8e8
